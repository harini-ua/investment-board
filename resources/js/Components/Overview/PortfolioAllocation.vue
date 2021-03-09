<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">Portfolio Allocation</h2>
      <apexchart ref="portfolio-allocation-chart" height="500" type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Portfolio Allocation' },
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
      //this.series = {
      //  data: [...Object.keys(this.data)],
      //}
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
