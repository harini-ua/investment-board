<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method:"
        info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
      />
      <date-input label="Date:">
        <date-picker
          v-model="filtersPage.date"
          value-type="YYYY-MM-DD"
          format="DD/MM/YYYY"
          type="date"
        />
      </date-input>
      <select-input
        v-model="filtersPage.currency"
        :options="payload.currency"
        label="Base currency:"
      />
      <select-input
        v-model="filtersPage.asset_class"
        :options="payload.asset_class"
        label="Asset Class:"
      />
      <select-input
        v-model="filtersPage.custodian"
        :options="payload.custodian"
        label="Custodian:"
      />
      <select-input
        v-model="filtersPage.account"
        :options="payload.account"
        label="Account:"
      />
    </filters-wrapper>
    <div class="row-chart">
      <exposure-chart />
      <exposure-table />
    </div>
    <hedging-table />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import ExposureChart from '@/Components/Currency/ExposureChart'
import ExposureTable from '@/Components/Currency/ExposureTable'
import HedgingTable from '@/Components/Currency/HedgingTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import DatePicker from 'vue2-datepicker'
import { pickBy, throttle } from 'lodash'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'

export default {
  metaInfo: { title: 'Currency' },
  layout: Layout,
  components: {
    DateInput,
    ExposureChart,
    ExposureTable,
    HedgingTable,
    FiltersWrapper,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    currency: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:      this.filters.method ? this.filters.method : this.payload.method[0],
        date:        this.filters.date ? this.filters.method : '2020-12-31',
        currency:    this.filters.currency ? this.filters.currency : this.payload.currency[0],
        asset_class: this.filters.asset_class ? this.filters.asset_class : this.payload.asset_class[0],
        custodian:   this.filters.custodian ? this.filters.custodian : this.payload.custodian[0],
        account:     this.filters.account ? this.filters.account : this.payload.account[0],
      },
    }
  },
  computed: {
    chartData: function () {
      let result = {}
      let sum = 0
      this.currency.forEach(item => {
        sum += item.aum
        result[item.currency] = (isNaN(result[item.currency]) ? 0 : result[item.currency]) + item.aum
      })

      for (var prop in result) {
        result[prop] = result[prop] / sum * 100
      }

      return result
    },
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
            'currency',
            Object.keys(query).length ? query : { remember: 'forget' }
          )
        )
      }, 150),
      deep: true,
    },
  },
}
</script>
