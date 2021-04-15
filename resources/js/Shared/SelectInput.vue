<template>
  <div class="filter-wrapper">
    <div class="filter-wrapper__label">
      <label v-if="label" class="select-form-label" :for="id">
        {{ label }}
      </label>
      <div v-if="info" class="tooltip">
        <svg class="icon icon-info"><use xlink:href="#icon-info"></use></svg>
        <div class="tooltip__content tooltip__filter">{{ info }}</div>
      </div>
    </div>
    <v-select
      v-model="selected"
      :input-id="id"
      :disabled="disabled"
      :no-drop="false"
      :searchable="false"
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
    id: String,
    disabled: {
      type: Boolean,
      default: false,
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
      this.$emit('change', this.id)
    },
    value() {
      this.selected = this.value
    },
  },
  methods: {
    focus() {
      this.$refs.input.focus()
    },
    select() {
      this.$refs.input.select()
    },
    getSelectedItem() {
      for (let i = 0; i < this.options.length; i++) {
        if (this.options[i]['code'] === this.value) {
          return this.options[i]
        }
      }
      return this.options[0] // set first default
    },
  },
}
</script>
