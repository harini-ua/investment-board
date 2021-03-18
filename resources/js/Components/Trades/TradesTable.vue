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
                <span class="td-cell">{{ item.date | date_format }}</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">{{ item.movement }}</span>
              </div>
              <div class="td" :title="item.name">
                <span class="td-cell">{{ item.name }}</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">{{ item.quantity | numeral }}</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">-</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">{{ item.net_price | price }}</span>
              </div>
              <div class="td hidden-sm">
                <span class="td-cell">{{ item.amount_base | numeral }}</span>
              </div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">Movement</div>
                  <div class="cell-description">{{ item.movement }}</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Quantity</div>
                  <div class="cell-description">{{ item.quantity | numeral }}</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Cost Price</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Net Price</div>
                  <div class="cell-description">{{ item.net_price | price }}</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Amount Local</div>
                  <div class="cell-description">{{ item.amount_base | numeral }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Custodian</div>
                  <div class="cell-description">{{ item.custodian }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">ISIN</div>
                  <div class="cell-description">{{ item.isin }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Issuer</div>
                  <div class="cell-description">{{ item.issuer }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Instrument</div>
                  <div class="cell-description">{{ item.instrument }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">CCY</div>
                  <div class="cell-description">{{ item.ccy }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Realised Local</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Realised Base</div>
                  <div class="cell-description">{{ item.realized_base }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Amount Base</div>
                  <div class="cell-description">{{ item.amount_base }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">FX Rate</div>
                  <div class="cell-description">{{ item.fx_rate }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Gross Price</div>
                  <div class="cell-description">{{ item.gross_price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">{{ item.comission }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">{{ item.tax }}</div>
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
      default: () => [],
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
