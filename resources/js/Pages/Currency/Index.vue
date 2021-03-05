<template>
  <div class="container">
    <filters-wrapper>
      <select-input
        v-model="filtersPage.method"
        :options="payload.method"
        label="Valuation Method"
        info="Tooltip text"
      />
      <date-picker v-model="filtersPage.date" format="DD/MM/YYYY" type="date" />
      <select-input
        v-model="filtersPage.currency"
        :options="payload.currency"
        label="Information text"
      />
    </filters-wrapper>

    <exposure-chart />
    <exposure-table />
    <hedging-table />
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import ExposureChart from '@/Components/Currency/ExposureChart'
import ExposureTable from '@/Components/Currency/ExposureTable'
import HedgingTable from '@/Components/Currency/HedgingTable'
import FiltersWrapper from '@/Shared/FiltersWrapper'
import SelectInput from '@/Shared/SelectInput'
import DatePicker from 'vue2-datepicker'
import { pickBy, throttle } from 'lodash'
import moment from 'moment'

export default {
  metaInfo: { title: 'Currency' },
  layout: Layout,
  components: {
    ExposureChart,
    ExposureTable,
    HedgingTable,
    FiltersWrapper,
    SelectInput,
    DatePicker,
  },
  props: {
    filters: Object,
    currency: Array,
    payload: Object,
  },
  data() {
    return {
      filtersPage: {
        method:   this.filters.method,
        date:     this.filters.date,
        currency: this.filters.currency,
      },
    }
  },
  computed: {
    chartData: function () {
      let result = {}
      let sum = 0
      this.currency.forEach(item => {
        sum += item.aum
        result[item.currency] = (isNaN(result[item.currency]) ? 0 : result[item.currency]) + item.aum
      })

      for (var prop in result) {
        result[prop] = result[prop] / sum * 100
      }

      return result
    },
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
            'currency',
            Object.keys(query).length ? query : { remember: 'forget' }
          )
        )
      }, 150),
      deep: true,
    },
  },
}
</script>
