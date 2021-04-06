<template>
  <div class="date-range-wrapper">
    <div class="filter-wrapper filter-wrapper--datapicker">
      <label v-if="labelFrom" class="form-label" :for="id">{{ labelFrom }}</label>
      <date-picker
        :id="id"
        v-model="valueFrom"
        :value-type="valueType"
        :format="format"
        :type="type"
        :disabled="disabled"
        :editable="false"
        :clearable="false"
      />
      <div v-if="errorFrom" class="form-error">{{ errorFrom }}</div>
    </div>
    <div class="filter-wrapper filter-wrapper--datapicker">
      <label v-if="labelTo" class="form-label" :for="id">{{ labelTo }}</label>
      <date-picker
        :id="id"
        v-model="valueTo"
        :value-type="valueType"
        :format="format"
        :type="type"
        :disabled="disabled"
        :editable="false"
        :clearable="false"
      />
      <div v-if="errorTo" class="form-error">{{ errorTo }}</div>
    </div>
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
        return `date-range-${this._uid}`
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
    valueFrom: [String, Number, Boolean, Object],
    valueTo: [String, Number, Boolean, Object],
    value: [String, Number, Boolean, Object],
    select: [String, Number, Boolean, Object],
    labelFrom: String,
    labelTo: String,
    infoTo: String,
    infoFrom: String,
    errorTo: String,
    errorFrom: String,
  },
  methods: {
    //
  },
}
</script>
