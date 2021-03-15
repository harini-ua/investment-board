<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">Portfolio Allocation</h2>
      <div style="width: 100%; height: auto">
        <apexchart
          ref="portfolio-allocation-chart"
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
  props: {
    data: Object,
  },
  data: function() {
    return {
      options: {
        chart: {
          id: 'portfolio-allocation-chart',
        },
        labels: this.chartLabels(),
        dataLabels: {
          enabled: false,
        },
        theme: {
          palette: 'palette6',
        },
        legend: {
          position: 'right',
          horizontalAlign: 'left',
          formatter: function(val, opts) {
            return '<span class="font-weight-500">' + val + '</span> <span class="font-weight-400">(' + opts.w.globals.series[opts.seriesIndex] + '%)</span>'
          },
          offsetY: -15,
          markers: {
            width:  16,
            height: 16,
          },
          itemMargin: {
            vertical: 4,
          },
          fontSize: 14,
          fontFamily: 'Inter',
          labels: {
            colors: '#3E4756',
          },
        },
        responsive: [
          {
            breakpoint: 1023,
            options: {
              chart: {
                width: '100%',
                height: 500,
              },
              legend: {
                offsetX: -30,
                position: 'bottom',
                fontSize: 12,
                width: 200,
              },
            },
          },{
            breakpoint: 767,
            options: {
              chart: {
                width: '100%',
                height: 500,
              },
              legend: {
                offsetX: -30,
                position: 'bottom',
                fontSize: 12,
                width: 200,
              },
            },
          },{
            breakpoint: 424,
            options: {
              chart: {
                width: '100%',
                height: 500,
              },
              legend: {
                offsetX: -30,
                position: 'bottom',
                fontSize: 12,
                width: 200,
              },
            },
          },{
            breakpoint: 374,
            options: {
              chart: {
                width: '100%',
                height: 500,
              },
              legend: {
                offsetX: -30,
                position: 'bottom',
                fontSize: 12,
                width: 200,
              },
            },
          },{
            breakpoint: 319,
            options: {
              chart: {
                width: '100%',
                height: 500,
              },
              legend: {
                offsetX: -30,
                position: 'bottom',
                fontSize: 12,
                width: 200,
              },
            },
          },
        ],
      },
      series: this.chartSeries(),
    }
  },
  computed: {
    //
  },
  watch: {
    data() {
      this.options = {
        labels: [...Object.keys(this.data)],
      }
      this.series = {
        data: [...Object.values(this.data)],
      }
    },
  },
  methods : {
    chartLabels() {
      return [...Object.keys(this.data)]
    },
    chartSeries() {
      return [...Object.values(this.data)]
    },
  },
}
</script>
