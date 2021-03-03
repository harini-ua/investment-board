<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2>Total Wealth Allocation</h2>
      <apexchart type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Total Wealth Allocation' },
  data: function() {
    return {
      options: {
        labels: ['Portfolio Assets', 'Category A', 'Category B',],
        dataLabels: {
          enabled: false,
        },
        legend: {
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
        },
      },
      series: [34.9, 34.1, 31],
    }
  },
}
</script>
