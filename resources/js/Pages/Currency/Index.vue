<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Currency</h1>

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

export default {
  metaInfo: { title: 'Currency' },
  layout: Layout,
  components: {
    ExposureChart,
    ExposureTable,
    HedgingTable,
  },
}
</script>
