<template>
  <div class="">
    <apexchart
      width="300"
      class="chart-wrapper"
      type="pie"
      :options="options"
      :series="series"
    />
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
        labels: this.chartLabels(),
        dataLabels: {
          enabled: false,
        },
        legend: {
          position: 'bottom',
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
      series: this.chartSeries(),
    }
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