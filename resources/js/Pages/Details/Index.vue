<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Details</h1>

    <report-total-table />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import ReportTotalTable from '@/Components/Details/ReportTotalTable'

export default {
  metaInfo: { title: 'Details' },
  layout: Layout,
  components: {
    ReportTotalTable,
  },
  props: {
    filters: Object,
    details: Object,
    payload: Array,
  },
}
</script>
