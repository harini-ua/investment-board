<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title">Portfolio assets</h3>
      <div class="table table--portfolio-assets">
        <div class="thead">
          <div class="tr">
            <div class="tr-group-content">
              <div class="td">Asset name</div>
              <div class="td">Value</div>
            </div>
            <div class="tr-group hidden-sm">
              <span class="tr-group__title">P&L</span>
              <div class="tr-group-content">
                <div class="td">Month</div>
                <div class="td">Year</div>
              </div>
            </div>
            <div class="tr-group hidden-lg">
              <span class="tr-group__title">PL %</span>
              <div class="tr-group-content">
                <div class="td">Month | Benchmark</div>
                <div class="td">Year | Benchmark</div>
              </div>
            </div>
          </div>
        </div>
        <div class="tbody">
          <div v-for="(item, index) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (index + 1)]"
          >
            <div class="tr" @click="toggle(index)">
              <div class="td">{{ item.asset_class }}</div>
              <div class="td">
                <inertia-link v-if="!item.total" :href="urlToDetails(index)" class="value" target="_blank">{{ item.mtd_value | numeral }}</inertia-link>
                <span v-else>{{ item.mtd_value | numeral }}</span>
              </div>
              <div class="td hidden-sm">{{ item.mtd_pl | numeral | is_negative }}</div>
              <div class="td hidden-sm">{{ item.ytd_pl | numeral | is_negative }}</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">{{ item.mtd_percentage | percentage }}</span>
                  <span class="double-value">{{ item.mtd_benchmark | percentage }}</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">{{ item.ytd_percentage | percentage }}</span>
                  <span class="double-value">{{ item.ytd_benchmark | percentage }}</span>
                </div>
              </div>
            </div>
            <div class="collapse-content collapse-content--portfolio-assets">
              <div class="collapse-content-table">
                <div class="row visible-lg">
                  <div class="cell"></div>
                  <div class="cell cell-description">Category</div>
                  <div class="cell cell-description">Benchmark</div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L MTD</div>
                  <div class="cell">{{ item.mtd_pl | numeral | is_negative }}</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">{{ item.ytd_pl | numeral | is_negative }}</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">{{ item.mtd_percentage | percentage }}</div>
                  <div class="cell">{{ item.mtd_benchmark | percentage }}</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">{{ item.ytd_percentage | percentage }}</div>
                  <div class="cell">{{ item.ytd_benchmark | percentage }}</div>
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
    urlToDetails(index) {
      let query = this.$parent.query
      query.asset_class = this.items[index]['asset_class']

      return this.route('details', Object.keys(query).length ? query : {})
    },
  },
}
</script>
