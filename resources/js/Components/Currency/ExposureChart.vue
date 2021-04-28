<template>
  <div class="block-chart-wrapper block-chart-wrapper--currency-exposure-chart">
    <div class="block-chart">
      <h3 class="block-chart__title">{{ title }}</h3>
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
  props: {
    title: {
      type: String,
      default: 'Currency Exposure Chart',
    },
    data: Array,
  },
  data: function() {
    return {
      options: {
        chart: {
          id: 'currency-exposure-chart',
        },
        labels: this.chartLabels(),
        dataLabels: { enabled: false },
        colors: this.$store.state.chartColor,
        tooltip: {
          y: {
            formatter: (value) => { return value + '%' },
          },
        },
        legend: {
          position: 'bottom',
          horizontalAlign: 'left',
          formatter: function(val, opts) {
            let label = val
            let value = opts.w.globals.series[opts.seriesIndex]

            return '' +
                '<span class="font-weight-500 apexcharts-legend-label">' + label + '</span>' +
                ' <span class="font-weight-400 apexcharts-legend-value">(' + value + '%)</span>'
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
            breakpoint: 5000,
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
      series: this.chartSeries(),
    }
  },
  methods : {
    chartLabels() {
      return [...Object.values(this.data).map(x => x.currency)]
    },
    chartSeries() {
      return [...Object.values(this.data).map(x => x.percentage)]
    },
  },
}
</script>
