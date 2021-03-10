<template>
  <div class="block-chart-wrapper">
    <div class="block-chart">
      <h2 class="block-chart__title">Total Wealth Allocation</h2>
      <apexchart ref="total-wealth-allocation-chart" type="pie" :options="options" :series="series" />
    </div>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Total Wealth Allocation' },
  props: {
    data: Object,
  },
  data: function() {
    return {
      options: {
        chart: {
          id: 'total-wealth-allocation-chart',
        },
        labels: ['Portfolio Assets', 'Category A', 'Category B'],
        dataLabels: {
          enabled: false,
        },
        legend: {
          position: 'right',
          horizontalAlign: 'left',
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
          offsetY: -25,
          markers: {
            width:  16,
            height: 16,
          },
          itemMargin: {
            vertical: 5,
            horizontal: 10,
          },
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: 500,
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
                offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },{
            breakpoint: 424,
            options: {
              legend: {
                offsetX: -30,
                offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },{
            breakpoint: 374,
            options: {
              legend: {
                offsetX: -30,
                offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },{
            breakpoint: 319,
            options: {
              legend: {
                offsetX: -30,
                offsetY: 0,
                position: 'bottom',
                fontSize: 12,
              },
            },
          },
        ],
      },
      series: [34.9, 34.1, 31],
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
