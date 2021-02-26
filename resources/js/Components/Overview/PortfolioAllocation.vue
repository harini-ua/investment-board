<template>
  <div>
    <apexchart width="500" type="pie" :options="options" :series="series"></apexchart>
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
      },
      series: [18.2, 23.7, 4.8, 12.5, 6.1, 1.4, 2.5, 27.5, 3.3],
    }
  },
}
</script>
