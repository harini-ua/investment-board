<template>
  <div class="">
    <div style="width: 100%; height: auto">
      <apexchart
        ref="currency-exposure-item-chart"
        class="chart-wrapper"
        type="pie"
        :options="options"
        :series="series"
      />
    </div>
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
            <div v-for="(custodian, asset_name) in this.data"
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
    data: Object,
  },
  data: function() {
    return {
      options: {
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
          width: 250,
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
                height: 360,
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
                height: 360,
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
