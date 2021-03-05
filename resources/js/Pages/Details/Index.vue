<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Tooltip text"
      />
      <date-picker v-model="filtersPage.date" format="DD/MM/YYYY" type="date" />
      <select-input
        v-model="filtersPage.currency"
        :options="payload.currency"
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
    positionOpen: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:   this.filters.method,
        date:     this.filters.date,
        currency: this.filters.currency,
      },
    }
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        if (query.date) {
          query.date = moment(String(query.date))
            .format('YYYY-MM-DD')
        }
        if (query.method) {
          query.method = query.method.code
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
