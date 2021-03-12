<template>
  <div class="container">
    <filters-wrapper>
      <date-input label="Date From">
        <date-picker
          v-model="filtersPage.from"
          value-type="YYYY-MM-DD"
          format="DD/MM/YYYY"
          type="date"
        />
      </date-input>
      <date-input label="Date To">
        <date-picker
          v-model="filtersPage.to"
          value-type="YYYY-MM-DD"
          format="DD/MM/YYYY"
          type="date"
        />
      </date-input>
      <select-input
        v-model="filtersPage.currency"
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
import DatePicker from 'vue2-datepicker'
import {pickBy, throttle} from 'lodash'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'

export default {
  metaInfo: { title: 'Trades' },
  layout: Layout,
  components: {
    DateInput,
    FiltersWrapper,
    TradesTable,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    trades: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        from:      this.filters.method ? this.filters.from : '2020-12-31',
        to:        this.filters.date ? this.filters.to : '2020-12-31',
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
        if (query.date) {
          query.date = moment(String(query.date))
            .format('YYYY-MM-DD')
        }
        if (query.method) {
          query.method = query.method.code
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
}
</script>
