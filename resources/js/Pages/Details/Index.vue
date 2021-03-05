<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.valuationMethod"
        :options="payload.valuationMethod"
        label="Valuation Method"
        info="Tooltip text"
      />
      <date-picker v-model="filtersPage.valuationDate" format="DD/MM/YYYY" type="date" />
      <select-input
        v-model="filtersPage.baseCurrency"
        :options="payload.baseCurrency"
        label="Information text"
      />
    </filters-wrapper>
    <report-total-table :items="positionOpen" />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import ReportTotalTable from '@/Components/Details/ReportTotalTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import DatePicker from 'vue2-datepicker'
import {pickBy, throttle} from 'lodash'
import moment from 'moment'

export default {
  metaInfo: { title: 'Details' },
  layout: Layout,
  components: {
    ReportTotalTable,
    FiltersWrapper,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    //details: Object,
    positionOpen: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        valuationMethod: this.filters.valuationMethod,
        valuationDate:   this.filters.valuationDate,
        baseCurrency:    this.filters.baseCurrency,
      },
    }
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        if (query.valuationDate) {
          query.valuationDate = moment(String(query.valuationDate))
            .format('YYYY-MM-DD')
        }
        if (query.valuationMethod) {
          query.valuationMethod = query.valuationMethod.code
        }
        this.$inertia.replace(
          this.route(
            'details',
            Object.keys(query).length ? query : { remember: 'forget' }
          )
        )
      }, 150),
      deep: true,
    },
  },
}
</script>
