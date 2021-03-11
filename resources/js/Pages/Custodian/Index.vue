<template>
  <div class="container">
    <filters-wrapper>
      <div class="column-filter">
        <select-input
          v-model="filtersPage.method"
          :options="payload.method"
          label="Valuation Method"
          info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
        />
      </div>
      <div class="column-filter">
        <date-input label="Valuation Date">
          <date-picker
            v-model="filtersPage.date"
            value-type="YYYY-MM-DD"
            format="DD/MM/YYYY"
            type="date"
          />
        </date-input>
      </div>
      <div class="column-filter">
        <select-input
          v-model="filtersPage.currency"
          :options="payload.currency"
          label="Base currency"
        />
      </div>
    </filters-wrapper>
    <custodians-table :items="custodians" />
    <custodian-chart />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import CustodianChart from '@/Components/Custodian/CustodianChart'
import CustodiansTable from '@/Components/Custodian/CustodiansTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import DatePicker from 'vue2-datepicker'
import { pickBy, throttle } from 'lodash'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'

export default {
  metaInfo: { title: 'Custodian' },
  layout: Layout,
  components: {
    DateInput,
    CustodianChart,
    CustodiansTable,
    FiltersWrapper,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    custodians: Array,
    payload: Array,
  },
  data() {
    return {
      filtersPage: {
        method:   this.filters.method ? this.filters.method : this.payload.method[0],
        date:     this.filters.date ? this.filters.method : '2020-12-31',
        currency: this.filters.currency ? this.filters.currency : this.payload.currency[0],
      },
    }
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        if (query.date) {
          query.date = moment(String(query.date))
            .format('YYYY-MM-DD')
        }
        if (query.method) {
          query.method = query.method.code
        }
        this.$inertia.replace(
          this.route(
            'custodian',
            Object.keys(query).length ? query : { remember: 'forget' }
          )
        )
      }, 150),
      deep: true,
    },
  },
}
</script>
