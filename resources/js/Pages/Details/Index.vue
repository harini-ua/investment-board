<template>
  <div class="container">
    <filters-wrapper description="Please pick the valuation method, valuation date, asset class, custodians and account if you need a custom consolidated summary.">
      <select-input
        id="method"
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Valuation method can be changed to see impact of derivatives.  Market value is the standard accounting value of the securities.  Exposure changes only for derivatives; delta is used for options, and notional value for futures."
        @change="changeHandler"
      />
      <date-input
        id="date"
        v-model="filtersPage.date"
        label="Valuation date"
        :options="payload.date"
        @change="changeHandler"
      />
      <select-input
        id="currency"
        v-model="filtersPage.currency"
        :disabled="true"
        :options="payload.currency"
        label="Base currency"
        @change="changeHandler"
      />
      <select-input
        id="asset_class"
        v-model="filtersPage.asset_class"
        :options="payload.asset_class"
        label="Asset Class"
        @change="changeHandler"
      />
      <select-input
        id="custodian"
        v-model="filtersPage.custodian"
        :options="payload.custodian"
        label="Custodian"
        @change="changeHandler"
      />
      <select-input
        id="account"
        v-model="filtersPage.account"
        :options="payload.account"
        label="Account"
        @change="changeHandler"
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
import moment from 'moment'
import DateInput from '../../Shared/DateInput'
import {pickBy, throttle} from 'lodash'

export default {
  metaInfo: { title: 'Details' },
  layout: Layout,
  components: {
    ReportTotalTable,
    FiltersWrapper,
    SelectInput,
    DateInput,
  },
  props: {
    filters: [Array, Object],
    positionOpen: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:      this.getMethod(),
        date:        this.filters.date ? this.filters.date : this.payload.date[0],
        currency:    this.payload.currency[0],
        asset_class: this.filters.asset_class ? this.filters.asset_class : this.payload.asset_class[0],
        custodian:   this.filters.custodian ? this.filters.custodian : this.payload.custodian[0],
        account:     this.filters.account ? this.filters.account : this.payload.account[0],
        chosen:      this.filters.chosen ? this.filters.chosen : 'method',
      },
    }
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        if (query.method) query.method = (query.method.code !== undefined) ? query.method.code : query.method
        if (query.date) query.date = moment(String(query.date)).format('YYYY-MM-DD')
        delete query.currency
        if (query.asset_class) query.asset_class = (query.asset_class.code !== undefined) ? query.asset_class.code : query.asset_class
        if (query.custodian) query.custodian = (query.custodian.code !== undefined) ? query.custodian.code : query.custodian

        if (query.chosen !== 'custodian') {
          if (query.account) query.account = (query.account.code !== undefined) ? query.account.code : query.account
        } else {
          this.filtersPage.account = this.payload.account[0]
          delete query.account
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
  methods: {
    getMethod() {
      if (this.filters.method) {
        for (let i=0; i < this.payload.method.length; i++) {
          if (this.payload.method[i].code === this.filters.method) {
            return this.payload.method[i]
          }
        }
      }

      return this.payload.method[0]
    },
    changeHandler(id) {
      this.filtersPage.chosen = id
    },
  },
}
</script>
