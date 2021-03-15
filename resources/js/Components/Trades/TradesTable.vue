<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title">Trades</h3>
      <div class="table table--trades">
        <div class="thead">
          <div class="tr">
            <div class="td">Date</div>
            <div class="td hidden-sm">Movement</div>
            <div class="td">Name</div>
            <div class="td hidden-sm">Quantity</div>
            <div class="td hidden-sm">Cost Price</div>
            <div class="td hidden-sm">Net Price</div>
            <div class="td hidden-sm">Amount Local</div>
          </div>
        </div>
        <div class="tbody">
          <div v-for="(item, index) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (index + 1)]"
          >
            <div class="tr" @click="toggle(index)">
              <div class="td">
                <span class="td-cell">7/15/2020</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">Buy</span>
              </div>
              <div class="td hidden-sm" title="ASML HOLDING">
                <span class="td-cell">Xtrackers ESG MSCI Japan UCITS ETF 1C</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">395</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">0,95</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">0,95</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">131 525</span>
              </div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">Interest</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Dividend</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Total</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Custodian</div>
                  <div class="cell-description">Crédit Suisse</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">ISIN</div>
                  <div class="cell-description">NL0010273215</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Issuer</div>
                  <div class="cell-description">Whirlpool</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Instrument</div>
                  <div class="cell-description">Equity</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">CCY</div>
                  <div class="cell-description">EUR</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Realised Local</div>
                  <div class="cell-description">6.890</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Realised Base</div>
                  <div class="cell-description">5.954</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Amount Base</div>
                  <div class="cell-description">131.525</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">FX Rate</div>
                  <div class="cell-description">1.2</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Gross Price</div>
                  <div class="cell-description">1.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">500.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">615.0</div>
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
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
        {'active': false},
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
      this.items[index]['active'] = !this.items[index]['active']
    },
  },
}
</script>
