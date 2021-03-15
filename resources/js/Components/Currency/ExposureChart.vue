<template>
  <div class="block-chart-wrapper block-chart-wrapper--currency-exposure-chart">
    <div class="block-chart">
      <h3 class="block-chart__title">Currency Exposure Chart</h3>
      <apexchart
        ref="currency-exposure-chart"
        class="chart-wrapper"
        :height="800"
        :width="300"
        type="pie"
        :options="options"
        :series="series"
      />
    </div>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      options: {
        chart: {
          id: 'currency-exposure-chart',
          offsetX: -25,
          width: 200,
          height: 200,
        },
        labels: ['CHF', 'EUR', 'USD', 'GBP', 'NOK', 'SEK', 'DKK', 'JPY', 'HKD', 'CAD'],
        dataLabels: { enabled: false },
        theme: { palette: 'palette6' },
        legend: {
          floating: false,
          position: 'bottom',
          horizontalAlign: 'left',
          width: 200,
          height: 'auto',
          offsetX: -10,
          offsetY: 0,
          formatter: function(val, opts) {
            return '<span class="font-weight-500">' + val + '</span> <span class="font-weight-400">(' + opts.w.globals.series[opts.seriesIndex] + '%)</span>'
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
          labels: {
            colors: '#3E4756',
          },
        },
      },
      series: [3.7, 49.5, 40.1, 4.1, 2.4, 0.3, 0, 0, 2.4, 2.4],
    }
  },
  computed: {
    //
  },
  watch: {
    //
  },
  methods : {
    //
  },
}
</script>
