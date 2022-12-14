<template>
  <div class="container">
    <filters-wrapper description="Please pick the valuation method, valuation date if you need a custom consolidated summary.">
      <select-input
        id="method"
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
        @change="changeHandler"
      />
      <date-input
        id="date"
        v-model="filtersPage.date"
        label="Valuation date"
        :options="payload.date"
        @change="changeHandler"
      />
    </filters-wrapper>
    <div class="row-chart">
      <portfolio-allocation-chart :data="portfolioAllocation" />
      <total-wealth-allocation-chart :data="totalWealthAllocation" />
    </div>
    <h2>Asset Classes</h2>
    <portfolio-assets-table :items="portfolioAsset" />
    <total-wealth-table :items="totalWealth" />
    <benchmarks-table :items="benchmarks" />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import PortfolioAllocationChart from '@/Components/Overview/PortfolioAllocationChart'
import TotalWealthAllocationChart from '@/Components/Overview/TotalWealthAllocationChart'
import PortfolioAssetsTable from '@/Components/Overview/PortfolioAssetsTable'
import TotalWealthTable from '@/Components/Overview/TotalWealthTable'
import BenchmarksTable from '@/Components/Overview/BenchmarksTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'
import { pickBy, throttle } from 'lodash'

export default {
  metaInfo: { title: 'Overview' },
  layout: Layout,
  components: {
    PortfolioAllocationChart,
    TotalWealthAllocationChart,
    PortfolioAssetsTable,
    TotalWealthTable,
    BenchmarksTable,
    FiltersWrapper,
    SelectInput,
    DateInput,
  },
  props: {
    filters: [Array, Object],
    portfolioAsset: Array,
    portfolioAllocation: [Array, Object],
    totalWealth: Array,
    totalWealthAllocation: [Array, Object],
    benchmarks: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:   this.getMethod(),
        date:     this.filters.date ? this.filters.date : this.payload.date[0],
        chosen:   this.filters.chosen ? this.filters.chosen : 'method',
      },
    }
  },
  computed: {
    query: function () {
      return this.getQuery()
    },
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = this.getQuery()

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
  methods: {
    getMethod() {
      if (this.filters.method) {
        for (let i=0; i < this.payload.method.length; i++) {
          if (this.payload.method[i].code === this.filters.method) {
            return this.payload.method[i]
          }
        }
      }

      return this.payload.method[0]
    },
    changeHandler(id) {
      this.filtersPage.chosen = id
    },
    getQuery() {
      let query = pickBy(this.filtersPage)

      if (query.method) query.method = (query.method.code !== undefined) ? query.method.code : query.method
      if (query.date) query.date = moment(String(query.date)).format('YYYY-MM-DD')

      return query
    },
  },
}
</script>
