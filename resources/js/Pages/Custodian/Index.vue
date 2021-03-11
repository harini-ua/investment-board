<template>
  <div class="container">
    <filters-wrapper>
        <select-input
          v-model="filtersPage.method"
          :options="payload.method"
          label="Valuation Method:"
          info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
        />
        <select-input label="Asset Class:" />
        <date-input label="Valuation date:">
          <date-picker
            v-model="filtersPage.date"
            value-type="YYYY-MM-DD"
            format="DD/MM/YYYY"
            type="date"
          />
        </date-input>
        <select-input label="Custodian:" />
        <select-input
          v-model="filtersPage.currency"
          :options="payload.currency"
          label="Base currency:"
        />
        <select-input label="Account:" />
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
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:   this.filters.method,
        date:     this.filters.date,
        currency: this.filters.currency,
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
