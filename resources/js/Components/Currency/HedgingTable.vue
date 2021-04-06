<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title">Currency Hedging</h3>
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
          >
            <div class="tr" @click="toggle(index)">
              <div class="td">{{ item.currency }}</div>
              <div class="td">{{ item.gross_assets | percentage | fixed }}</div>
              <div class="td hidden-sm">{{ item.fx | percentage | fixed }}</div>
              <div class="td hidden-lg">{{ item.net_assets | percentage | fixed }}</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">{{ item.fx | percentage | fixed }}</div>
                </div>
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">{{ item.net_assets | percentage | fixed }}</div>
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
      if (window.innerWidth < 1024) {
        this.items[index]['active'] = !this.items[index]['active']
      }
    },
  },
}
</script>
