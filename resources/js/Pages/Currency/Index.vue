<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.valuationMethod"
        :options="payload.valuationMethod"
        label="Valuation Method"
        info="Tooltip text"
      />
      <date-picker v-model="filtersPage.valuationDate" format="DD/MM/YYYY" type="date" />
      <select-input
        v-model="filtersPage.baseCurrency"
        :options="payload.baseCurrency"
        label="Information text"
      />
    </filters-wrapper>

    <exposure-chart />
    <exposure-table />
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

export default {
  metaInfo: { title: 'Currency' },
  layout: Layout,
  components: {
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
        valuationMethod: this.filters.valuationMethod,
        valuationDate:   this.filters.valuationDate,
        baseCurrency:    this.filters.baseCurrency,
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
        if (query.valuationDate) {
          query.valuationDate = moment(String(query.valuationDate))
            .format('YYYY-MM-DD')
        }
        if (query.valuationMethod) {
          query.valuationMethod = query.valuationMethod.code
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
