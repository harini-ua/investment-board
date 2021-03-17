<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.from"
        :options="payload.from"
        label="Date From"
      />
      <select-input
        v-model="filtersPage.to"
        :options="payload.to"
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
    <trades-table />
  </div>
</template>

<script>

import Layout from '@/Shared/Layout'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import TradesTable from '@/Components/Trades/TradesTable'
import SelectInput from '@/Shared/SelectInput'
import {pickBy, throttle} from 'lodash'

export default {
  metaInfo: { title: 'Trades' },
  layout: Layout,
  components: {
    FiltersWrapper,
    TradesTable,
    SelectInput,
  },
  props: {
    filters: Object,
    trades: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        from:        this.filters.from ? this.filters.from : this.payload.from[0],
        to:          this.filters.date ? this.filters.to : this.payload.to[0],
        currency:    this.filters.currency ? this.filters.currency : this.payload.currency[0],
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
        if (query.from) query.from = query.from.code
        if (query.to) query.to = query.to.code
        if (query.currency) query.currency = query.currency.code
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
