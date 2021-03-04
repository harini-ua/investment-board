<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2>Total Wealth Allocation</h2>
      <apexchart height="500" type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Total Wealth Allocation' },
  data: function() {
    return {
      options: {
        chart: {
          id: 'total-wealth-allocation-chart',
        },
        labels: ['Portfolio Assets', 'Category A', 'Category B'],
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
      series: [34.9, 34.1, 31],
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
      return window.innerWidth < 600 ? 'bottom' : 'right'
    },
  },
}
</script>
