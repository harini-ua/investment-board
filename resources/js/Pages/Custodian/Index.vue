<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Valuation method can be changed to see impact of derivatives. Market value is the standard accounting value of the securities. Exposure changes only for derivatives; delta is used for options, and notional value for futures."
      />
      <select-input
        v-model="filtersPage.date"
        :options="payload.date"
        label="Valuation date"
      />
      <select-input
        v-model="filtersPage.currency"
        :disabled="true"
        :options="payload.currency"
        label="Base currency"
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
import { pickBy, throttle } from 'lodash'
import moment from 'moment'

export default {
  metaInfo: { title: 'Custodian' },
  layout: Layout,
  components: {
    CustodianChart,
    CustodiansTable,
    FiltersWrapper,
    SelectInput,
  },
  props: {
    filters: Object,
    custodians: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:   this.filters.method ? this.filters.method : this.payload.method[0],
        date:     this.filters.date ? this.filters.date : this.payload.date[0],
        currency: this.filters.currency ? this.filters.currency : this.payload.currency[0],
      },
      index: 0,
    }
  },
  watch: {
    filtersPage: {
      handler: throttle(function() {
        let query = pickBy(this.filtersPage)
        if (query.date) query.date = query.date.code
        if (query.method) query.method = query.method.code
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
}
</script>
