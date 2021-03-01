<template>
    <div class="block-chart-wrapper">
        <div class="block-chart">
            <h2 class="block-chart__title">Portfolio Allocation</h2>
            <apexchart width="500" type="pie" :options="options" :series="series"></apexchart>
        </div>
    </div>
</template>

<script>

export default {
  metaInfo: { title: 'Portfolio Allocation' },
  data: function() {
    return {
      options: {
        labels: ['Cash', 'Equity', 'KFP Equity', 'Bond', 'KFP Bond', 'Hedge Fund', 'Commodity', 'Private Equity', 'Real Estate'],
        dataLabels: {
          enabled: false,
        },
        legend: {
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
        },
          // responsive: [
          //     {
          //         breakpoint: 1000,
          //         options: {
          //             plotOptions: {
          //                 bar: {
          //                     horizontal: false
          //                 }
          //             },
          //             legend: {
          //                 position: "bottom"
          //             }
          //         }
          //     }
          // ]
      },
        plotOptions: {
            pie: {
                donut: {
                    size: '20%'
                }
            },
        },

        chart: {
            width: "203px",
            height: 203,
            type: "pie"
        },
      series: [18.2, 23.7, 4.8, 12.5, 6.1, 1.4, 2.5, 27.5, 3.3],
    }
  },
}
</script>
