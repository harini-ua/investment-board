<template>
  <div class="container">
    <filters-wrapper>
      <div class="column-filter">
        <select-input
          v-model="filtersPage.method"
          :options="payload.method"
          label="Valuation Method"
          info="Valuation method can be changed to see impact of derivatives.  Market value is the standard accounting value of the securities.  Exposure changes only for derivatives; delta is used for options, and notional value for futures."
        />
        <select-input
          v-model="filtersPage.asset_class"
          :options="payload.asset_class"
          label="Asset Class"
        />
      </div>
      <div class="column-filter">
        <date-input label="Date">
          <date-picker
            v-model="filtersPage.date"
            value-type="YYYY-MM-DD"
            format="DD/MM/YYYY"
            type="date"
          />
        </date-input>
        <select-input
          v-model="filtersPage.custodian"
          :options="payload.custodian"
          label="Custodian"
        />
      </div>
      <div class="column-filter">
        <select-input
          v-model="filtersPage.currency"
          :options="payload.currency"
          label="Base currency"
        />
        <select-input
          v-model="filtersPage.account"
          :options="payload.account"
          label="Account"
        />
      </div>
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
import DateInput from '../../Shared/DateInput'

export default {
  metaInfo: { title: 'Details' },
  layout: Layout,
  components: {
    DateInput,
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
        method:      this.filters.method,
        date:        this.filters.date,
        currency:    this.filters.currency,
        asset_class: this.filters.asset_class,
        custodian:   this.filters.custodian,
        account:     this.filters.account,
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
