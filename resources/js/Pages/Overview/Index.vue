<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.valuationMethod"
        label="Valuation Method"
        custom_class="custom-drop"
      >
        <option :value="null" label="All" />
        <option v-for="(item, index) in payload.valuationMethod" :key="index" :value="index">{{ item }}</option>
      </select-input>
      <date-picker type="date" />
      <select-input
        v-model="filtersPage.baseCurrency"
        label="Base Currency"
        custom_class="custom-drop"
      >
        <option :value="null" label="All" />
        <option v-for="(item, index) in payload.baseCurrency" :key="index" :value="index">{{ item }}</option>
      </select-input>
    </filters-wrapper>
    <div class="row-chart">
      <portfolio-allocation />
      <total-wealth-allocation />
    </div>
    <portfolio-assets-table />
    <total-wealth-table />
    <benchmarks-table />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import PortfolioAllocation from '@/Components/Overview/PortfolioAllocation'
import TotalWealthAllocation from '@/Components/Overview/TotalWealthAllocation'
import PortfolioAssetsTable from '@/Components/Overview/PortfolioAssetsTable'
import TotalWealthTable from '@/Components/Overview/TotalWealthTable'
import BenchmarksTable from '@/Components/Overview/BenchmarksTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import DatePicker from 'vue2-datepicker'
import { pickBy, throttle } from 'lodash'

export default {
  metaInfo: { title: 'Overview' },
  layout: Layout,
  components: {
    PortfolioAllocation,
    TotalWealthAllocation,
    PortfolioAssetsTable,
    TotalWealthTable,
    BenchmarksTable,
    FiltersWrapper,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    //overview: Object,
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
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        this.$inertia.replace(
          this.route(
            'overview',
            Object.keys(query).length ? query : { remember: 'forget' }
          )
        )
      }, 150),
      deep: true,
    },
  },
}
</script>
