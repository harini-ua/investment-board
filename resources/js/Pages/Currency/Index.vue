<template>
  <div class="container">
    <filters-wrapper description="Please pick the valuation method, valuation date, custodians and account if you need a custom consolidated summary.">
      <select-input
        id="method"
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
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
    <div class="row-chart">
      <exposure-chart ref="chart" :data="currencyExposureCart" />
      <exposure-table ref="table" :items="currencyExposureData" />
    </div>
    <hedging-table ref="table" :items="currencyHedging" />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import ExposureChart from '@/Components/Currency/ExposureChart'
import ExposureTable from '@/Components/Currency/ExposureTable'
import HedgingTable from '@/Components/Currency/HedgingTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'
import {pickBy, throttle} from 'lodash'

export default {
  metaInfo: { title: 'Currency' },
  layout: Layout,
  components: {
    ExposureChart,
    ExposureTable,
    HedgingTable,
    FiltersWrapper,
    SelectInput,
    DateInput,
  },
  props: {
    filters: [Array, Object],
    currencyExposureCart: Array,
    currencyExposureData: Array,
    currencyHedging: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:      this.getMethod(),
        date:        this.filters.date ? this.filters.date : this.payload.date[0],
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
        if (query.custodian) query.custodian = (query.custodian.code !== undefined) ? query.custodian.code : query.custodian

        if (query.chosen !== 'custodian') {
          if (query.account) query.account = (query.account.code !== undefined) ? query.account.code : query.account
        } else {
          this.filtersPage.account = this.payload.account[0]
          delete query.account
        }

        this.$inertia.replace(
          this.route(
            'currency',
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
