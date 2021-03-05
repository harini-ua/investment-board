<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title">Open positions</h3>
      <div class="table table--open-position">
        <div class="thead">
          <div class="tr">
            <div class="td">Name</div>
            <div class="td hidden-sm">Units</div>
            <div class="td hidden-sm">Last Purchase</div>
            <div class="td hidden-sm">CCY</div>
            <div class="td hidden-sm">Cost Price</div>
            <div class="td hidden-sm">Valuation Price</div>
            <div class="td hidden-sm">Cost Local</div>
            <div class="td hidden-sm">Value Local</div>
            <div class="td hidden-sm">Value Base</div>
            <div class="td hidden-xl">P&L MTD</div>
            <div class="td hidden-xl">P&L YTD</div>
            <div class="td hidden-xl">% MTD</div>
            <div class="td hidden-xl">% YTD</div>
            <div class="td hidden-xl">% Since Purchase</div>
          </div>
        </div>

        <div class="tbody">
          <div v-for="(item, index) in items"
               :id="'item-' + item.id"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (index + 1)]"
               @click="toggle(index)"
          >

            <div class="tr">
              <div class="td">{{ item.instrument_name }}</div>
              <div class="td hidden-sm">-</div>
              <div class="td hidden-sm">{{ item.last_purchase | date_format }}</div>
              <div class="td hidden-sm">-</div>
              <div class="td hidden-sm">{{ item.cost_price | number_to_string }}</div>
              <div class="td hidden-sm">{{ item.valuation_price | number_to_string }}</div>
              <div class="td hidden-sm">{{ item.cost_local | number_to_string }}</div>
              <div class="td hidden-sm">{{ item.valuation_local | number_to_string }}</div>
              <div class="td hidden-sm">{{ item.valuation_base | number_to_string }}</div>
              <div class="td hidden-xl">{{ item.mtd_pl | number_to_string }}</div>
              <div class="td hidden-xl">{{ item.ytd_pl | number_to_string }}</div>
              <div class="td hidden-xl">{{ item.mtd_return | percentage }}</div>
              <div class="td hidden-xl">{{ item.ytd_return | percentage }}</div>
              <div class="td hidden-xl">{{ item.sp_return | percentage }}</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">Units</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Last Purchase</div>
                  <div class="cell-description">{{ item.last_purchase }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">CCY</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Cost Price</div>
                  <div class="cell-description">{{ item.cost_price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Valuation Price</div>
                  <div class="cell-description">{{ item.valuation_price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Cost Local</div>
                  <div class="cell-description">{{ item.cost_local }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Value Local</div>
                  <div class="cell-description">{{ item.valuation_local }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Value Base</div>
                  <div class="cell-description">{{ item.valuation_base }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">P&L MTD</div>
                  <div class="cell-description">{{ item.mtd_pl }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">P&L YTD</div>
                  <div class="cell-description">{{ item.ytd_pl }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% MTD</div>
                  <div class="cell-description">{{ item.mtd_return | percentage }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% YTD</div>
                  <div class="cell-description">{{ item.ytd_return | percentage }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% Since Purchase</div>
                  <div class="cell-description">{{ item.sp_return | percentage }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Interest</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Dividend</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">-</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Total</div>
                  <div class="cell-description">-</div>
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
