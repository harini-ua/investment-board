<template>
  <div class="filter-wrapper">
    <label v-if="label" class="select-form-label" :for="id">
      {{ label }}
      <div v-if="info" class="tooltip">
        <svg class="icon icon-info"><use xlink:href="#icon-info"></use></svg>
        <div class="tooltip__content tooltip__filter">{{ info }}</div>
      </div>
    </label>
    <v-select
      :id="id"
      v-model="selected"
      :disabled="disabled"
      :no-drop="noDrap"
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
    id: {
      type: String,
      default() {
        return `select-input-${this._uid}`
      },
    },
    disabled: {
      type: Boolean,
      default: false,
    },
    noDrap: {
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
      selected: this.getSelectedItem(),
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
