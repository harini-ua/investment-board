<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">Portfolio Allocation</h2>
      <apexchart height="500" type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Portfolio Allocation' },
  data: function() {
    return {
      options: {
        chart: {
          id: 'portfolio-allocation-chart',
        },
        labels: ['Cash', 'Equity', 'KFP Equity', 'Bond', 'KFP Bond', 'Hedge Fund', 'Commodity', 'Private Equity', 'Real Estate'],
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
        },
      },
      series: [18.2, 23.7, 4.8, 12.5, 6.1, 1.4, 2.5, 27.5, 3.3],
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
