<template>
  <div class="block-table block-table--currency-exposure">
    <div class="table-holder">
      <h3 class="table-title">Currency Exposure</h3>
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
          >
            <div class="tr" @click="toggle(index)">
              <div class="td">{{ item.currency }}</div>
              <div class="td hidden-sm">
                <p v-if="!item.grant_total"><a v-if="item.cash" :href="route('details')">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></p>
                <p v-else><span v-if="item.cash">{{ item.cash | numeral | is_negative }}</span><span v-else>-</span></p>
              </div>
              <div class="td hidden-sm">
                <p v-if="!item.grant_total"><a v-if="item.cash" :href="route('details')">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></p>
                <p v-else><span v-if="item.investments">{{ item.investments | numeral | is_negative }}</span><span v-else>-</span></p>
              </div>
              <div class="td hidden-lg">
                <p v-if="!item.grant_total"><a v-if="item.cash" :href="route('details')">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></p>
                <p v-else><span v-if="item.fx">{{ item.fx | numeral | is_negative }}</span><span v-else>-</span></p>
              </div>
              <div class="td">{{ item.total | numeral | is_negative }}</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">Cash</div>
                  <div class="cell-description">
                    <p v-if="!item.grant_total"><a v-if="item.cash" :href="route('details')">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></p>
                    <p v-else><span v-if="item.cash">{{ item.cash | numeral | is_negative }}</span><span v-else>-</span></p>
                  </div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Investments</div>
                  <div class="cell-description">
                    <p v-if="!item.grant_total"><a v-if="item.cash" :href="route('details')">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></p>
                    <p v-else><span v-if="item.investments">{{ item.investments | numeral | is_negative }}</span><span v-else>-</span></p>
                  </div>
                </div>
                <div class="cell-row visible-lg">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">
                    <p v-if="!item.grant_total"><a v-if="item.cash" :href="route('details')">{{ item.cash | numeral | is_negative }}</a><span v-else>-</span></p>
                    <p v-else><span v-if="item.fx">{{ item.fx | numeral | is_negative }}</span><span v-else>-</span></p>
                  </div>
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
        {'currency': 'CHF', 'cash': '1306924', 'investments': '220456', 'fx': '2094413', 'total': '3621792', 'active': false, 'grant_total': false},
        {'currency': 'EUR', 'cash': '4738496 ', 'investments': '36473412', 'fx': '7556976', 'total': '48768884', 'active': false, 'grant_total': false},
        {'currency': 'USD', 'cash': '10920015', 'investments': '26696836', 'fx': '2006748', 'total': '39623599', 'active': false, 'grant_total': false},
        {'currency': 'GBP', 'cash': '397574', 'investments': '3701366', 'fx': null, 'total': '4098940', 'active': false, 'grant_total': false},
        {'currency': 'NOK', 'cash': null, 'investments': '2409016', 'fx': null, 'total': '2409016', 'active': false, 'grant_total': false},
        {'currency': 'SEK', 'cash': '137507', 'investments': '148764', 'fx': null, 'total': '286271', 'active': false, 'grant_total': false},
        {'currency': 'DKK', 'cash': null, 'investments': '300000', 'fx': null, 'total': '286271', 'active': false, 'grant_total': false},
        {'currency': 'JPY', 'cash': null, 'investments': '300000', 'fx': null, 'total': '286271', 'active': false, 'grant_total': false},
        {'currency': 'HKD', 'cash': null, 'investments': '20298', 'fx': '-11122612', 'total': '-11122612', 'active': false, 'grant_total': false},
        {'currency': 'CAD', 'cash': null, 'investments': '49997', 'fx': null, 'total': '49997', 'active': false, 'grant_total': false},
        {'currency': 'Total', 'cash': '17500516', 'investments': '69699846', 'fx': '535525', 'total': '87735886', 'active': false, 'grant_total': true},
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
