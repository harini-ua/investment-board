<template>
  <div class="block-table block-table--currency-exposure">
    <div class="table-holder">
      <h3 class="table-title table-title--currency-exposure">Currency Exposure</h3>
      <div class="table table--currency-exposure">
        <div class="thead">
          <div class="tr">
            <div class="td">Currency</div>
            <div class="td hidden-sm">Cash</div>
            <div class="td hidden-sm">Investments</div>
            <div class="td hidden-lg">FX Forwards</div>
            <div class="td">Total</div>
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
              <div class="td hidden-sm"><a v-if="item.cash" href="#">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></div>
              <div class="td hidden-sm"><a v-if="item.investments" href="#">{{ item.investments | numeral | is_negative }}</a><span v-else>-</span></div>
              <div class="td hidden-lg"><a v-if="item.fx" href="#">{{ item.fx | numeral | is_negative }}</a><span v-else>-</span></div>
              <div class="td">{{ item.total | numeral | is_negative }}</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">Cash</div>
                  <div class="cell-description"><a v-if="item.cash" href="#">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Investments</div>
                  <div class="cell-description"><a v-if="item.investments" href="#">{{ item.investments | numeral | is_negative }}</a><span v-else>-</span></div>
                </div>
                <div class="cell-row visible-lg">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description"><a v-if="item.fx" href="#">{{ item.fx | numeral | is_negative }}</a><span v-else>-</span></div>
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
        {'currency': 'CHF', 'cash': '1306924', 'investments': '220456', 'fx': '2094413', 'total': '3621792', 'active': false},
        {'currency': 'EUR', 'cash': '4738496 ', 'investments': '36473412', 'fx': '7556976', 'total': '48768884', 'active': false},
        {'currency': 'USD', 'cash': '10920015', 'investments': '26696836', 'fx': '2006748', 'total': '39623599', 'active': false},
        {'currency': 'GBP', 'cash': '397574', 'investments': '3701366', 'fx': null, 'total': '4098940', 'active': false},
        {'currency': 'NOK', 'cash': null, 'investments': '2409016', 'fx': null, 'total': '2409016', 'active': false},
        {'currency': 'SEK', 'cash': '137507', 'investments': '148764', 'fx': null, 'total': '286271', 'active': false},
        {'currency': 'DKK', 'cash': null, 'investments': '300000', 'fx': null, 'total': '286271', 'active': false},
        {'currency': 'JPY', 'cash': null, 'investments': '300000', 'fx': null, 'total': '286271', 'active': false},
        {'currency': 'HKD', 'cash': null, 'investments': '20298', 'fx': '-11122612', 'total': '-11122612', 'active': false},
        {'currency': 'CAD', 'cash': null, 'investments': '49997', 'fx': null, 'total': '49997', 'active': false},
        {'currency': 'Total', 'cash': '17500516', 'investments': '69699846', 'fx': '535525', 'total': '87735886', 'active': false},
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
