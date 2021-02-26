<template>
  <div>
    <apexchart width="500" type="pie" :options="options" :series="series"></apexchart>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Private Holding' },
  data: function() {
    return {
      options: {
        labels: ['Private Equity', 'Real Estate'],
        dataLabels: {
          enabled: false,
        },
        legend: {
          formatter: function(val, opts) {
            return val + ' (' + opts.w.globals.series[opts.seriesIndex]+'%)'
          },
        },
      },
      series: [74.6, 25.4],
    }
  },
}
</script>
