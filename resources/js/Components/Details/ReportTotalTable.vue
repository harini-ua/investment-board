<template>
  <div class="block-table">
    <div class="row-total">
      <h2>Report Total (base):</h2>
      <h2>{{ total | numeral }}</h2>
    </div>
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
            <div class="td hidden-xl">Cost Local</div>
            <div class="td hidden-xl">Value Local</div>
            <div class="td hidden-xl">Value Base</div>
            <div class="td hidden-xl">P&L MTD</div>
            <div class="td hidden-xl">P&L YTD</div>
            <div class="td hidden-xl">% MTD</div>
            <div class="td hidden-xl">% YTD</div>
            <div class="td hidden-xl">% Since Purchase</div>
          </div>
        </div>

        <div class="tbody">
          <div v-for="(item, index) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (index + 1)]"
          >
            <div class="tr" @click="toggle(index)">
              <div class="td" :title="item.instrument_name">
                <span class="td-cell">{{ item.instrument_name }}</span>
              </div>
              <div class="td hidden-sm" :title="$options.filters.numeral(item.quantity)">
                <span class="td-cell">{{ item.quantity | numeral }}</span>
              </div>
              <div class="td hidden-sm" :title="$options.filters.date_format(item.last_purchase)">
                <span v-if="item.last_purchase" class="td-cell">{{ item.last_purchase | date_format }}</span><span v-else class="td-cell">-</span>
              </div>
              <div class="td hidden-sm" :title="item.currency">
                <span class="td-cell">{{ item.currency }}</span>
              </div>
              <div class="td hidden-sm" :title="$options.filters.price(item.cost_price)">
                <span class="td-cell">{{ item.cost_price | price }}</span>
              </div>
              <div class="td hidden-sm" :title="$options.filters.price(item.valuation_price)">
                <span class="td-cell">{{ item.valuation_price | price }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.numeral(item.cost_local)">
                <span class="td-cell">{{ item.cost_local | numeral }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.numeral(item.valuation_local)">
                <span class="td-cell">{{ item.valuation_local | numeral }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.numeral(item.valuation_base)">
                <span class="td-cell">{{ item.valuation_base | numeral }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.numeral(item.mtd_pl)">
                <span class="td-cell">{{ item.mtd_pl | numeral }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.numeral(item.ytd_pl)">
                <span class="td-cell">{{ item.ytd_pl | numeral }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.percentage(item.mtd_return)">
                <span class="td-cell">{{ item.mtd_return | percentage }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.percentage(item.ytd_return)">
                <span class="td-cell">{{ item.ytd_return | percentage }}</span>
              </div>
              <div class="td hidden-xl" :title="$options.filters.percentage(item.sp_return)">
                <span class="td-cell">{{ item.sp_return | percentage }}</span>
              </div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">Units</div>
                  <div class="cell-description">{{ item.quantity | numeral }}</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Last Purchase</div>
                  <div class="cell-description"><span v-if="item.last_purchase">{{ item.last_purchase | date_format }}</span><span v-else>-</span></div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">CCY</div>
                  <div class="cell-description">{{ item.currency }}</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Cost Price</div>
                  <div class="cell-description">{{ item.cost_price | round(2) }}</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Valuation Price</div>
                  <div class="cell-description">{{ item.valuation_price | round(2) }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">Cost Local</div>
                  <div class="cell-description">{{ item.cost_local | numeral }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">Value Local</div>
                  <div class="cell-description">{{ item.valuation_local | numeral }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">Value Base</div>
                  <div class="cell-description">{{ item.valuation_base | numeral }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">P&L MTD</div>
                  <div class="cell-description">{{ item.mtd_pl | numeral }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">P&L YTD</div>
                  <div class="cell-description">{{ item.ytd_pl | numeral }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">% MTD</div>
                  <div class="cell-description">{{ item.mtd_return | percentage }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">% YTD</div>
                  <div class="cell-description">{{ item.ytd_return | percentage }}</div>
                </div>
                <div class="cell-row visible-xl">
                  <div class="cell-thead">% Since Purchase</div>
                  <div class="cell-description">{{ item.sp_return | percentage }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Interest</div>
                  <div class="cell-description">{{ item.interest | price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Dividend</div>
                  <div class="cell-description">{{ item.dividend | price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">{{ item.commission | price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">{{ item.tax | price }}</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Total</div>
                  <div class="cell-description">{{ totalRow(index) | price }}</div>
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
  computed: {
    total: function () {
      return this.items.reduce((prev, cur) => Number.parseInt(prev) + Number.parseInt(cur.valuation_base), 0)
    },
  },
  methods: {
    toggle(index) {
      this.items[index]['active'] = !this.items[index]['active']
    },
    totalRow(index) {
      return Number.parseFloat(this.items[index].interest) +
          Number.parseFloat(this.items[index].dividend) +
          Number.parseFloat(this.items[index].commission) +
          Number.parseFloat(this.items[index].tax)
    },
  },
}
</script>
