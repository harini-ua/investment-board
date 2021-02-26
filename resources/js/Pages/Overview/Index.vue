<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Overview</h1>

    <portfolio-allocation />
    <total-wealth-allocation />
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

export default {
  metaInfo: { title: 'Overview' },
  layout: Layout,
  components: {
    PortfolioAllocation,
    TotalWealthAllocation,
    PortfolioAssetsTable,
    TotalWealthTable,
    BenchmarksTable,
  },
}
</script>
