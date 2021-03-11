<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title table-title--currency-hedging">Currency Hedging</h3>
      <div class="table table--currency-hedging">
        <div class="thead">
          <div class="tr">
            <div class="td">Currency</div>
            <div class="td">Gross Assets</div>
            <div class="td hidden-sm">FX Forwards</div>
            <div class="td hidden-lg">Net Assets</div>
          </div>
        </div>
        <div class="tbody">
          <div v-for="(item, index) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (index + 1)]"
               @click="toggle(index)"
          >
            <div class="tr">
              <div class="td">{{ item.currency }}</div>
              <div class="td">{{ item.gross_assets }}%</div>
              <div class="td hidden-sm">{{ item.fx }}%</div>
              <div class="td hidden-lg">{{ item.net_assets }}%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">{{ item.fx }}%</div>
                </div>
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">{{ item.net_assets }}%</div>
                </div>
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
    items: {
      type: Array,
      default: () => [
        {'currency': 'EUR', 'gross_assets': '47,0', 'fx': '8,6', 'net_assets': '55,6', 'active': false},
        {'currency': 'USD', 'gross_assets': '42,9', 'fx': '42,9', 'net_assets': '42,9', 'active': false},
        {'currency': 'GBP', 'gross_assets': '4,7', 'fx': '0,0', 'net_assets': '4,7', 'active': false},
        {'currency': 'NOK', 'gross_assets': '2,7', 'fx': '0,0', 'net_assets': '2,7', 'active': false},
        {'currency': 'SEK', 'gross_assets': '0,3', 'fx': '0,0', 'net_assets': '0,3', 'active': false},
        {'currency': 'CAD', 'gross_assets': '0,1', 'fx': '0,0', 'net_assets': '0,1', 'active': false},
        {'currency': 'HKD', 'gross_assets': '0,0', 'fx': '-12,7', 'net_assets': '-12,7', 'active': false},
        {'currency': 'Total', 'gross_assets': '99,4', 'fx': '0,6', 'net_assets': '100', 'active': false},
      ],
    },
  },
  data: function () {
    return {
      //
    }
  },
  methods: {
    toggle(index) {
      if (window.innerWidth < 1024) {
        this.items[index]['active'] = !this.items[index]['active']
      }
    },
  },
}
</script>
