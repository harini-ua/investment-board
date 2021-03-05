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
    <div class="row-chart">
      <portfolio-allocation />
      <total-wealth-allocation />
    </div>
    <h2>Asset Classes</h2>
    <portfolio-assets-table :items="portfolioAsset" />
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
import moment from 'moment'

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
    portfolioAsset: Array,
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
        if (query.valuationDate) {
          query.valuationDate = moment(String(query.valuationDate))
            .format('YYYY-MM-DD')
        }
        if (query.valuationMethod) {
          query.valuationMethod = query.valuationMethod.code
        }
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
