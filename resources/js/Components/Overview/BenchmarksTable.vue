<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title">Benchmarks</h3>
      <div class="table table--benchmarks">
        <div class="thead">
          <div class="tr">
            <div class="td">Asset name</div>
            <div class="td">% MTD</div>
            <div class="td">% YTD</div>
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
                <div class="tooltip">
                  <svg class="icon icon-info"><use xlink:href="#icon-info" /></svg>
                  <div class="tooltip__content">
                    Performance of dynamic asset allocation
                  </div>
                </div>
                {{ item.indice }}
              </div>
              <div class="td">{{ item.mtd_percentage | percentage }}</div>
              <div class="td">{{ item.ytd_percentage | percentage }}</div>
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
