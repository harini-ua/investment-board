<template>
  <div class="select-holder">
<!--    <label v-if="label" class="select-form-label" :for="id">{{ label }}:</label>-->
<!--    <select :id="id" ref="input" v-model="selected" v-bind="$attrs" class="form-select">-->
<!--      <slot />-->
<!--    </select>-->
    <Select2
      :id="id"
      :settings="settings"
      :options="selectOptions"
      v-model="selected"
    />
  </div>
</template>

<script>
import Select2 from 'v-select2-component'

export default {
  inheritAttrs: false,
  components: {
    Select2,
  },
  props: {
    id: {
      type: String,
      default() {
        return `select-input-${this._uid}`
      },
    },
    value: [String, Number, Boolean],
    label: String,
    placeholder: String,
    custom_class: String,
  },
  data() {
    let options = this.options;
    if(typeof options == 'object') {
      options = Object.values(options);
    }
    let classPrefix = this.custom_class ? this.custom_class : 'select';

    return {
      selected: this.value,
      selectOptions: options,
      settings: {
        minimumResultsForSearch: this.search ? 0 : Infinity,
        containerCssClass: `custom-select-${classPrefix}`,
        dropdownCssClass: `custom-drop-${classPrefix}`,
        placeholder: this.placeholder
      },
    }
  },
  watch: {
    selected(selected) {
      this.$emit('changed', selected)
    },
  },
  methods: {
    // focus() {
    //   this.$refs.input.focus()
    // },
    // select() {
    //   this.$refs.input.select()
    // },
    // onChange: function(value) {
    //   this.$emit('changed', value);
    // }
  },
}
</script>
