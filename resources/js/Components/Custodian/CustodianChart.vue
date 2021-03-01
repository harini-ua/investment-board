<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">{{ title }}</h2>
      <apexchart width="500" type="pie" :options="options" :series="series"></apexchart>
    </div>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      title: 'Private Holding',
      options: {
        labels: ['Private Equity', 'Real Estate'],
        dataLabels: {
          enabled: false,
        },
        legend: {
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
        },
      },
      series: [74.6, 25.4],
    }
  },
}
</script>
