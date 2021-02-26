<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Currency</h1>

    <currency-exposure />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import CurrencyExposure from '@/Components/Currency/CurrencyExposure'

export default {
  metaInfo: { title: 'Currency' },
  layout: Layout,
  components: {
    CurrencyExposure
  },
}
</script>
