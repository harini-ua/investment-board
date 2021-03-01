<template>
  <div class="container">
    <filters>
      <select-input
        v-model="filters.valuation_method"
        label="Valuation Method"
      >
        <option :value="null" label="All" />
        <option v-for="(item, index) in payload.valuationMethod" :key="index" :value="index">{{ item }}</option>
      </select-input>
      <date-picker type="default" />
      <select-input
          v-model="filters.base_currency"
          label="Base Currency"
      >
        <option :value="null" label="All" />
        <option v-for="(item, index) in payload.baseCurrency" :key="index" :value="index">{{ item }}</option>
      </select-input>
    </filters>
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
import Filters from '@/Shared/Filters'
import SelectInput from '@/Shared/SelectInput'
import DatePicker from 'vue2-datepicker'

export default {
  metaInfo: { title: 'Overview' },
  layout: Layout,
  components: {
    PortfolioAllocation,
    TotalWealthAllocation,
    PortfolioAssetsTable,
    TotalWealthTable,
    BenchmarksTable,
    Filters,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    //overview: Object,
    payload: Object,
  },
}
</script>
