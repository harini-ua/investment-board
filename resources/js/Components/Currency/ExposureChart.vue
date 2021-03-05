<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">{{ title }}</h2>
      <apexchart type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      title: 'Currency Exposure Chart',
      options: {
        chart: {
          id: 'currency-exposure-chart',
        },
        labels: ['CHF', 'EUR', 'USD', 'GBP', 'NOK', 'SEK', 'DKK', 'JPY', 'HKD', 'CAD'],
        dataLabels: {
          enabled: false,
        },
        legend: {
          position: this.legendPosition(),
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
      series: [3.7, 49.5, 40.1, 4.1, 2.4, 0.3, 0, 0, 2.4, 2.4],
    }
  },
  computed: {
    windowWidth() {
      return this.$store.state.windowWidth
    },
    windowHeight() {
      return this.$store.state.windowHeight
    },
  },
  watch: {
    windowWidth(newWidth) {
      this.options = {
        legend: {
          position: newWidth < 700 ? 'bottom' : 'right',
        },
      }
    },
  },
  methods : {
    legendPosition: function () {
      return window.innerWidth < 700 ? 'bottom' : 'right'
    },
  },
}
</script>
