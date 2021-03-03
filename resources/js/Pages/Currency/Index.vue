<template>
  <div>
    <filters-wrapper>
      <select-input
        v-model="filtersPage.valuationMethod"
        label="Valuation Method"
      >
        <option :value="null" label="All" />
        <option v-for="(item, index) in payload.valuationMethod" :key="index" :value="index">{{ item }}</option>
      </select-input>
      <date-picker
        v-model="filtersPage.valuationDate"
        type="date"
      />
      <select-input
        v-model="filtersPage.baseCurrency"
        label="Base Currency"
      >
        <option :value="null" label="All" />
        <option v-for="(item, index) in payload.baseCurrency" :key="index" :value="index">{{ item }}</option>
      </select-input>
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
