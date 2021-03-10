<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">{{ title }}</h2>
      <apexchart ref="currency-exposure-chart" type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      title: 'Private Holding',
      options: {
        chart: {
          id: 'currency-exposure-chart',
        },
        labels: ['Private Equity', 'Real Estate'],
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
      series: [74.6, 25.4],
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
