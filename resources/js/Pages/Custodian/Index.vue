<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Custodian</h1>

    <private-holding />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import PrivateHolding from '@/Components/Custodian/PrivateHolding'

export default {
  metaInfo: { title: 'Custodian' },
  layout: Layout,
  components: {
    PrivateHolding
  },
}
</script>
