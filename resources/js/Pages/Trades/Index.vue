<template>
  <div class="container">
    <filters-wrapper description="Please pick the date range, asset class, custodians and account if you need a custom consolidated summary.">
      <date-input
        id="from"
        v-model="filtersPage.from"
        label="Date From"
        :options="payload.from"
        @change="changeHandler"
      />
      <date-input
        id="to"
        v-model="filtersPage.to"
        label="Date To"
        :options="payload.to"
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
    <trades-table :items="trades" />
  </div>
</template>

<script>

import Layout from '@/Shared/Layout'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import TradesTable from '@/Components/Trades/TradesTable'
import SelectInput from '@/Shared/SelectInput'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'
import {pickBy, throttle} from 'lodash'

export default {
  metaInfo: { title: 'Trades' },
  layout: Layout,
  components: {
    DateInput,
    FiltersWrapper,
    TradesTable,
    SelectInput,
  },
  props: {
    filters: [Array, Object],
    trades: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        from:        this.getMethod(),
        to:          this.filters.to ? this.filters.to : this.payload.to[0],
        currency:    this.payload.currency[0],
        asset_class: this.filters.asset_class ? this.filters.asset_class : this.payload.asset_class[0],
        custodian:   this.filters.custodian ? this.filters.custodian : this.payload.custodian[0],
        account:     this.filters.account ? this.filters.account : this.payload.account[0],
        chosen:      this.filters.chosen ? this.filters.chosen : 'from',
      },
    }
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        if (query.from) query.from = moment(String(query.from)).format('YYYY-MM-DD')
        if (query.to) query.to = moment(String(query.to)).format('YYYY-MM-DD')
        delete query.currency
        if (query.asset_class) query.asset_class = (query.asset_class.code !== undefined) ? query.asset_class.code : query.asset_class
        if (query.custodian) query.custodian = (query.custodian.code !== undefined) ? query.custodian.code : query.custodian
        if (query.account) query.account = (query.account.code !== undefined) ? query.account.code : query.account

        if (query.chosen !== 'custodian') {
          if (query.account) query.account = (query.account.code !== undefined) ? query.account.code : query.account
        } else {
          this.filtersPage.account = this.payload.account[0]
          delete query.account
        }

        this.$inertia.replace(
          this.route(
            'trades',
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
