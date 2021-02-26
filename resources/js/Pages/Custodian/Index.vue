<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Custodian</h1>

    <custodians-table />
    <custodian-chart />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import CustodianChart from '@/Components/Custodian/CustodianChart'
import CustodiansTable from '@/Components/Custodian/CustodiansTable'

export default {
  metaInfo: { title: 'Custodian' },
  layout: Layout,
  components: {
    CustodianChart,
    CustodiansTable,
  },
}
</script>
