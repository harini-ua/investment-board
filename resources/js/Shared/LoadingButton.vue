<template>
  <button :disabled="loading" class="btn">
    <div v-if="loading" />
    <slot />
  </button>
</template>

<script>
export default {
  props: {
    loading: Boolean,
  },
}
</script>
