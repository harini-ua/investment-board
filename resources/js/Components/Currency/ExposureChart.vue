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
      title: 'Currency Exposure Chart',
      options: {
        labels: ['CHF', 'EUR', 'USD', 'GBP', 'NOK', 'SEK', 'DKK', 'JPY', 'HKD', 'CAD'],
        dataLabels: {
          enabled: false,
        },
        legend: {
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
        },
      },
      series: [3.7, 495, 40.1, 4.1, 2.4, 0.3, 0, 0, 2.4, 2.4],
    }
  },
}
</script>
