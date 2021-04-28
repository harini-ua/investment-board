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
          <div v-for="(item, i) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (i + 1)]"
          >
            <div class="tr" @click="toggle(i)">
              <div class="td">{{ item.currency }}</div>
              <div class="td hidden-sm">
                  <span v-if="item.cash">{{ item.cash | numeral | is_negative }}</span>
                  <span v-else>-</span>
              </div>
              <div class="td hidden-sm">
                  <span v-if="item.investment">{{ item.investment | numeral | is_negative }}</span>
                  <span v-else>-</span>
              </div>
              <div class="td hidden-lg">
                  <span v-if="item.fx">{{ item.fx | numeral | is_negative }}</span>
                  <span v-else>-</span>
              </div>
              <div class="td">{{ item.total | numeral | is_negative }}</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-md">
                  <div class="cell-thead">Cash</div>
                  <div class="cell-description">
                    <span v-if="!item.grant_total"><inertia-link v-if="item.cash" :href="route('details')" class="value" target="_blank">{{ item.cash | numeral | is_negative }}</inertia-link><span v-else>-</span></span>
                    <p v-else><span v-if="item.cash">{{ item.cash | numeral | is_negative }}</span><span v-else>-</span></p>
                  </div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">Investments</div>
                  <div class="cell-description">
                    <span v-if="!item.grant_total"><inertia-link v-if="item.investment" :href="route('details')" class="value" target="_blank">{{ item.investment | numeral | is_negative }}</inertia-link><span v-else>-</span></span>
                    <span v-else><span v-if="item.investment">{{ item.investment | numeral | is_negative }}</span><span v-else>-</span></span>
                  </div>
                </div>
                <div class="cell-row visible-lg">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">
                    <span v-if="!item.grant_total"><inertia-link v-if="item.fx" :href="route('details')" class="value" target="_blank">{{ item.fx | numeral | is_negative }}</inertia-link><span v-else>-</span></span>
                    <span v-else><span v-if="item.fx">{{ item.fx | numeral | is_negative }}</span><span v-else>-</span></span>
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
      default: () => [],
    },
  },
  data: function () {
    return {
      index: 0,
    }
  },
  methods: {
    toggle(index) {
      if (window.innerWidth < 1024) {
        this.items[index]['active'] = !this.items[index]['active']
      }
    },
    selected(index) {
      this.index = index
    },
  },
}
</script>
