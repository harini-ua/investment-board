<template>
  <div class="select-holder">
    <label v-if="label" class="select-form-label" :for="id">{{ label }}</label>
    <div v-if="info" class="tooltip">
      <svg class="icon icon-info"><use xlink:href="#icon-info"></use></svg>
      <div class="tooltip__content">{{ info }}</div>
    </div>
    <v-select
      :id="id"
      v-model="selected"
      :options="options"
      class="form-select"
      :class="{ error: error }"
    />
    <div v-if="error" class="form-error">{{ error }}</div>
  </div>
</template>

<script>

export default {
  inheritAttrs: false,
  props: {
    id: {
      type: String,
      default() {
        return `select-input-${this._uid}`
      },
    },
    value: [String, Number, Boolean, Object],
    label: String,
    info: String,
    error: String,
    options: Array,
  },
  data() {
    return {
      selected: this.value,
    }
  },
  watch: {
    selected(val) {
      this.$emit('input', val)
    },
  },
  methods: {
    focus() {
      this.$refs.input.focus()
    },
    select() {
      this.$refs.input.select()
    },
  },
}
</script>
