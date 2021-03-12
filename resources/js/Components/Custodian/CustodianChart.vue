<template>
  <div class="block-chart-wrapper block-chart-wrapper--custodians-chart">
    <div class="block-chart">
      <h2 class="block-chart__title">{{ title }}</h2>
      <apexchart
        ref="currency-exposure-chart"
        class="chart-wrapper"
        type="pie"
        :options="options"
        :series="series"
      />
    </div>
    <div class="block-table">
      <div class="table-holder table-holder--custodians-chart-table">
        <div class="table table--custodians-chart-table">
          <div class="thead">
            <div class="tr">
              <div class="td">Asset name</div>
              <div class="td">Value</div>
            </div>
          </div>
          <div class="tbody">
            <div class="tr-holder">
              <div class="tr">
                <div class="td">Private Equity</div>
                <div class="td">6 584 366,34</div>
              </div>
            </div>
            <div class="tr-holder">
              <div class="tr">
                <div class="td">Real Estate</div>
                <div class="td">2 241 671,53</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    title: {
      type: String,
      default: 'Chart',
    },
    data: Object,
  },
  data: function() {
    return {
      options: {
        chart: {
          id: 'currency-exposure-chart',
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
      this.series = [...Object.values(this.data)]
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
