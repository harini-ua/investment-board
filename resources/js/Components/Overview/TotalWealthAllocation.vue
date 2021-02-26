<template>
  <div>
    <apexchart width="500" type="pie" :options="options" :series="series"></apexchart>
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
