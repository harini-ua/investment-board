<template>
  <div>
    <apexchart width="500" type="pie" :options="options" :series="series"></apexchart>
  </div>
</template>

<script>

export default {
  metaInfo: { title: 'Currency Exposure' },
  data: function() {
    return {
      options: {
        labels: ['CHF', 'EUR', 'USD', 'GBP', 'NOK', 'SEK', 'DKK', 'JPY', 'HKD', 'CAD'],
        dataLabels: {
          enabled: false,
        },
      },
      series: [3.7, 495, 40.1, 4.1, 2.4, 0.3, 0, 2.4, 2.4],
    }
  },
}
</script>
