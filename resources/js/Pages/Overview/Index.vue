<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Overview</h1>

    <portfolio-allocation />
    <total-wealth-allocation />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import PortfolioAllocation from '@/Components/Overview/PortfolioAllocation'
import TotalWealthAllocation from '@/Components/Overview/TotalWealthAllocation'

export default {
  metaInfo: { title: 'Overview' },
  layout: Layout,
  components: {
    PortfolioAllocation,
    TotalWealthAllocation
  },
}
</script>
