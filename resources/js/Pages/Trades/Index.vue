<template>
  <div class="container">
    <filters-wrapper>
      <date-input
        v-model="filtersPage.from"
        label="Date From"
      />
      <date-input
        v-model="filtersPage.to"
        label="Date To"
      />
      <select-input
        v-model="filtersPage.currency"
        :disabled="true"
        :options="payload.currency"
        label="Base currency"
      />
      <select-input
        v-model="filtersPage.asset_class"
        :options="payload.asset_class"
        label="Asset Class"
      />
      <select-input
        v-model="filtersPage.custodian"
        :options="payload.custodian"
        label="Custodian"
      />
      <select-input
        v-model="filtersPage.account"
        :options="payload.account"
        label="Account"
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
    FiltersWrapper,
    TradesTable,
    SelectInput,
    DateInput,
  },
  props: {
    filters: Object,
    trades: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        from:        this.filters.from ? this.filters.from : this.payload.from,
        to:          this.filters.to ? this.filters.to : this.payload.to,
        currency:    this.payload.currency[0],
        asset_class: this.filters.asset_class ? this.filters.asset_class : this.payload.asset_class[0],
        custodian:   this.filters.custodian ? this.filters.custodian : this.payload.custodian[0],
        account:     this.filters.account ? this.filters.account : this.payload.account[0],
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
        if (query.asset_class) query.asset_class = query.asset_class.code
        if (query.custodian) query.custodian = query.custodian.code
        if (query.account) query.account = query.account.code

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
}
</script>
