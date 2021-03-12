<template>
<div class="test">
  <apexchart
    width="300"
    class="chart-wrapper"
    type="pie"
    :options="options"
    :series="series"
  />
  <div class="block-table block-table--custodians-chart-inner">
    <div class="table-holder table-holder--custodians-chart-inner">
      <div class="table table--custodians-chart-inner">
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
