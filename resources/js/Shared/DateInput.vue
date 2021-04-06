<template>
  <div class="filter-wrapper filter-wrapper--datapicker">
    <label v-if="label" class="form-label" :for="id">{{ label }}</label>
    <date-picker
      :id="id"
      v-model="selected"
      :value-type="valueType"
      :format="format"
      :type="type"
      :disabled="disabled"
      :editable="false"
      :clearable="false"
    />
    <div v-if="error" class="form-error">{{ error }}</div>
  </div>
</template>
<script>

import DatePicker from 'vue2-datepicker'

export default {
  components: {
    DatePicker,
  },
  props: {
    id: {
      type: String,
      default() {
        return `date-input-${this._uid}`
      },
    },
    disabled: {
      type: Boolean,
      default: false,
    },
    valueType: {
      type: String,
      default: 'YYYY-MM-DD',
    },
    format: {
      type: String,
      default: 'MM/DD/YYYY',
    },
    type: {
      type: String,
      default: 'date',
    },
    value: [String, Number, Boolean, Object],
    select: [String, Number, Boolean, Object],
    label: String,
    info: String,
    error: String,
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
    //
  },
}
</script>
