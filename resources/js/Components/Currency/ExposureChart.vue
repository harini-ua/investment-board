<template>
  <div class="block-chart-wrapper block-chart-wrapper--currency-exposure-chart">
    <div class="block-chart">
      <h3 class="block-chart__title">Currency Exposure Chart</h3>
      <div style="width: 100%; height: auto">
        <apexchart
          ref="currency-exposure-chart"
          class="chart-wrapper"
          type="pie"
          :options="options"
          :series="series"
        />
      </div>
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
        },
        labels: ['CHF', 'EUR', 'USD', 'GBP', 'NOK', 'SEK', 'DKK', 'JPY', 'HKD', 'CAD'],
        dataLabels: { enabled: false },
        theme: { palette: 'palette6' },
        legend: {
          position: 'bottom',
          horizontalAlign: 'left',
          formatter: function(val, opts) {
            return '<span class="font-weight-500">' + val + '</span> <span class="font-weight-400">(' + opts.w.globals.series[opts.seriesIndex] + '%)</span>'
          },
          width: 150,
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
        responsive: [
          {
            breakpoint: 2560,
            options: {
              chart: {
                width: '100%',
                height: 600,
              },
              legend: {
                offsetX: -33,
                position: 'bottom',
                fontSize: 12,
                width: 150,
              },
            },
          },{
            breakpoint: 1023,
            options: {
              chart: {
                width: '100%',
                height: 600,
              },
              legend: {
                offsetX: -33,
                position: 'bottom',
                fontSize: 12,
                width: 150,
              },
            },
          },{
            breakpoint: 767,
            options: {
              chart: {
                width: '100%',
                height: 600,
              },
              legend: {
                offsetX: -33,
                position: 'bottom',
                fontSize: 12,
                width: 150,
              },
            },
          },{
            breakpoint: 424,
            options: {
              chart: {
                width: '100%',
                height: 600,
              },
              legend: {
                offsetX: -33,
                position: 'bottom',
                fontSize: 12,
                width: 150,
              },
            },
          },{
            breakpoint: 374,
            options: {
              chart: {
                width: '100%',
                height: 600,
              },
              legend: {
                offsetX: -33,
                position: 'bottom',
                fontSize: 12,
                width: 150,
              },
            },
          },{
            breakpoint: 319,
            options: {
              chart: {
                width: '100%',
                height: 600,
              },
              legend: {
                offsetX: -33,
                position: 'bottom',
                fontSize: 12,
                width: 150,
              },
            },
          },
        ],
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
