<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Valuation method can be changed to see impact of derivatives.  Market value is the standard accounting value of the securities.  Exposure changes only for derivatives; delta is used for options, and notional value for futures."
      />
      <select-input
        v-model="filtersPage.date"
        :options="payload.date"
        label="Date"
      />
      <select-input
        v-model="filtersPage.currency"
        :disabled="true"
        :no-drap="false"
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
    <report-total-table :items="positionOpen" />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import ReportTotalTable from '@/Components/Details/ReportTotalTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import {pickBy, throttle} from 'lodash'

export default {
  metaInfo: { title: 'Details' },
  layout: Layout,
  components: {
    ReportTotalTable,
    FiltersWrapper,
    SelectInput,
  },
  props: {
    filters: Object,
    positionOpen: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:      this.filters.method ? this.filters.method : this.payload.method[0],
        date:        this.filters.date ? this.filters.date : this.payload.date[0],
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
        if (query.date) query.date = query.date.code
        if (query.method) query.method = query.method.code
        if (query.currency) query.currency = query.currency.code
        if (query.asset_class) query.asset_class = query.asset_class.code
        if (query.custodian) query.custodian = query.custodian.code
        if (query.account) query.account = query.account.code

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
