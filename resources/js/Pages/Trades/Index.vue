<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Trades</h1>

    <trades-table />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import TradesTable from '@/Components/Trades/TradesTable'

export default {
  metaInfo: { title: 'Trades' },
  layout: Layout,
  component: {
    TradesTable,
  },
  props: {
    filters: Object,
    trades: Object,
    payload: Array,
  },
}
</script>
