<template>
  <div class="container">
    <filters-wrapper description="Please pick the valuation method, valuation date, currency if you need a custom consolidated summary.">
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
        id="currency"
        v-model="filtersPage.currency"
        :options="payload.currency"
        label="Currency"
        @change="changeHandler"
      />
    </filters-wrapper>
    <div class="row-chart">
      <custodians-table ref="table" :items="custodians" />
      <custodian-chart ref="chart" :title="custodians[index]['custodian_name']" :data="custodians[index]['asset']" />
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import CustodianChart from '@/Components/Custodian/CustodianChart'
import CustodiansTable from '@/Components/Custodian/CustodiansTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import moment from 'moment'
import DateInput from '../../Shared/DateInput'
import { pickBy, throttle } from 'lodash'

export default {
  metaInfo: { title: 'Custodian' },
  layout: Layout,
  components: {
    CustodianChart,
    CustodiansTable,
    FiltersWrapper,
    SelectInput,
    DateInput,
  },
  props: {
    filters: [Array, Object],
    custodians: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:   this.getMethod(),
        date:     this.filters.date ? this.filters.date : this.payload.date[0],
        currency: this.filters.currency ? this.filters.currency : this.payload.currency[0],
        chosen:   this.filters.chosen ? this.filters.chosen : 'method',
      },
      index: 0,
    }
  },
  computed: {
    query: function () {
      return this.getQuery()
    },
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = this.getQuery()

        this.$inertia.replace(
          this.route(
            'custodian',
            Object.keys(query).length ? query : { remember: 'forget' }
          )
        )
      }, 150),
      deep: true,
    },
  },
  mounted() {
    this.$watch(
      () => {
        return this.$refs.table.index
      },
      (val) => {
        this.index = val
      }
    )
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
    getQuery() {
      let query = pickBy(this.filtersPage)

      if (query.method) query.method = (query.method.code !== undefined) ? query.method.code : query.method
      if (query.date) query.date = moment(String(query.date)).format('YYYY-MM-DD')
      if (query.currency) query.currency = (query.currency.code !== undefined) ? query.currency.code : query.currency

      return query
    },
  },
}
</script>
