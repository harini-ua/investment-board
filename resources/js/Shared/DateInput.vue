<template>
  <div class="filter-wrapper filter-wrapper--datapicker">
    <label v-if="label" class="form-label" :for="id">{{ label }}</label>
    <date-picker
      v-model="selected"
      :input-attr="attrs"
      :disabled-date="disabledDate"
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
import moment from 'moment'

export default {
  components: {
    DatePicker,
  },
  props: {
    id: String,
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
    options: Array,
    label: String,
    info: String,
    error: String,
  },
  data() {
    return {
      selected: this.value,
    }
  },
  computed: {
    attrs: function () {
      return {
        id: this.id,
        name: this.id,
      }
    },
  },
  watch: {
    selected(val) {
      this.$emit('input', val)
      this.$emit('change', this.id)
    },
  },
  methods: {
    disabledDate(date) {
      let length = this.options.length
      let disabled = true

      for(let i = 0; i < length; i++) {
        let temDate = new Date(
          moment(this.options[i]).year(),
          moment(this.options[i]).month(),
          moment(this.options[i]).date()
        )

        if (date.getTime() === temDate.getTime()) {
          disabled = false
        }
      }

      return disabled
    },
  },
}
</script>
