<template>
  <div class="container">
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
