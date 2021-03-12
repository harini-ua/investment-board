<template>
  <div class="container">
    <filters-wrapper>
        <select-input
          v-model="filtersPage.method"
          :options="payload.method"
          label="Valuation method"
          info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
        />
      <date-input label="Valuation date">
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
        label="Base currency"
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
import DatePicker from 'vue2-datepicker'
import { pickBy, throttle } from 'lodash'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'

export default {
  metaInfo: { title: 'Overview' },
  layout: Layout,
  components: {
    DateInput,
    PortfolioAllocationChart,
    TotalWealthAllocationChart,
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
    portfolioAllocation: Object,
    totalWealth: Array,
    totalWealthAllocation: Object,
    benchmarks: Array,
    payload: Object,
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
          query.date = moment(String(query.date)).format('YYYY-MM-DD')
        }
        if (query.method) {
          query.method = query.method.code
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
