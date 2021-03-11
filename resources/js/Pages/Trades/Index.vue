<template>
  <div class="container">
    <filters-wrapper>
      <div class="column-filter">
        <date-input label="From">
          <date-picker
            v-model="filtersPage.from"
            value-type="YYYY-MM-DD"
            format="DD/MM/YYYY"
            type="date"
          />
        </date-input>
        <select-input
          v-model="filtersPage.asset_class"
          :options="payload.asset_class"
          label="Asset Class"
        />
      </div>
      <div class="column-filter">
        <date-input label="To">
          <date-picker
            v-model="filtersPage.to"
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
    <trades-table :items="trades" />
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
