<template>
  <div class="block-chart-wrapper block-chart-wrapper--custodians-chart">
    <div class="block-chart">
      <h2 class="block-chart__title">{{ title }}</h2>
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
            <div v-for="(custodian, asset_name) in data"
                 :key="custodian.value"
                 class="tr-holder"
            >
              <div class="tr">
                <div class="td">{{ asset_name }}</div>
                <div class="td">{{ custodian.value | numeral }}</div>
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
          offsetX: -30,
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
          position: 'right',
          horizontalAlign: 'left',
          formatter: function(val, opts) {
            let label = val
            let value = opts.w.globals.series[opts.seriesIndex]

            return '' +
                '<span class="font-weight-500 apexcharts-legend-label">' + label + '</span>' +
                ' <span class="font-weight-400 apexcharts-legend-value">(' + value + '%)</span>'
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
        responsive: [
          {
            breakpoint: 1023,
            options: {
              chart: {
                width: '100%',
                height: 500,
                offsetX: -23,
              },
              legend: {
                offsetX: -10,
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
      this.series = [...Object.values(this.data).map(x => x.percentage)]
    },
  },
  methods : {
    chartLabels() {
      return [...Object.keys(this.data)]
    },
    chartSeries() {
      return [...Object.values(this.data).map(x => x.percentage)]
    },
  },
}
</script>
