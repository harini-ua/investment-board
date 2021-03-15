<template>
  <div class="block-chart-wrapper block-chart-wrapper--custodians-chart">
    <div class="block-chart">
      <h2 class="block-chart__title">{{ title }}</h2>
      <apexchart
        ref="currency-exposure-chart"
        class="chart-wrapper"
        type="pie"
        :options="options"
        :series="series"
      />
    </div>
    <div class="block-table">
      <div class="table-holder table-holder--custodians-chart-table">
        <div class="table table--custodians-chart-table">
          <div class="thead">
            <div class="tr">
              <div class="td">Asset name</div>
              <div class="td">Value</div>
            </div>
          </div>
          <div class="tbody">
            <div v-for="(custodian, asset_name) in this.data"
                 :key="custodian.value"
                 class="tr-holder"
            >
              <div class="tr">
                <div class="td">{{ asset_name }}</div>
                <div class="td">{{ custodian.value | numeral }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    title: {
      type: String,
      default: 'Chart',
    },
    data: Object,
  },
  data: function() {
    return {
      options: {
        chart: {
          id: 'currency-exposure-chart',
        },
        labels: this.chartLabels(),
        dataLabels: {
          enabled: false,
        },
        legend: {
          position: 'right',
          horizontalAlign: 'left',
          width: 200,
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
          markers: {
            width:  16,
            height: 16,
          },
          itemMargin: {
            vertical: 5,
          },
          fontSize: '14px',
          fontFamily: 'Inter',
          fontWeight: 500,
          labels: {
            colors: '#3E4756',
          },
        },
      },
      series: this.chartSeries(),
    }
  },
  computed: {
    //
  },
  watch: {
    data() {
      this.options = {
        labels: [...Object.keys(this.data)],
      }
      this.series = [...Object.values(this.data).map(x => x.percentage)]
    },
  },
  methods : {
    chartLabels() {
      return [...Object.keys(this.data)]
    },
    chartSeries() {
      return [...Object.values(this.data).map(x => x.percentage)]
    },
  },
}
</script>
