<template>
  <div class="filter-wrapper filter-wrapper--datapicker">
    <label v-if="label" class="form-label" :for="id">{{ label }}:</label>
    <slot />
    <div v-if="error" class="form-error">{{ error }}</div>
  </div>
</template>

<script>

export default {
  props: {
    label: String,
    error: String,
  },
  methods: {
    //
  },
}
</script>
