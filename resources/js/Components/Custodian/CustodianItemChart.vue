<template>
  <div class="">
    <apexchart
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
        theme: { palette: 'palette6' },
        chart: {
          width: 300,
          height: 300,
        },
        legend: {
          position: 'bottom',
          horizontalAlign: 'left',
          width: 250,
          formatter: function(val, opts) {
            return '<span class="font-weight-500">' + val + '</span> <span class="font-weight-400">(' + opts.w.globals.series[opts.seriesIndex] + '%)</span>'
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
              legend: {
                position: 'bottom',
                fontSize: 14,
              },
            },
          },{
            breakpoint: 767,
            options: {
              legend: {
                offsetX: -30,
                //offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },{
            breakpoint: 425,
            options: {
              chart: {
                width: 300,
                height: 300,
              },
              legend: {
                offsetX: -30,
                //offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },{
            breakpoint: 374,
            options: {
              chart: {
                width: 300,
                height: 300,
              },
              legend: {
                offsetX: -35,
                //offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },{
            breakpoint: 319,
            options: {
              chart: {
                width: 300,
                height: 300,
              },
              legend: {
                offsetX: -35,
                //offsetY: 0,
                position: 'bottom',
                fontSize: 12,
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
