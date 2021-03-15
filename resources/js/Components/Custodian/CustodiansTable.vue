<template>
  <div class="block-table block-table--custodians">
    <div class="table-holder">
      <h3 class="table-title">Custodians</h3>
      <div class="table table--custodians">
        <div class="thead">
          <div class="tr">
            <div class="td">Custodian</div>
            <div class="td">Value</div>
          </div>
        </div>
        <div class="tbody">
          <div v-for="(item, index) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (index + 1)]"
          >
            <div class="tr" @click="toggle(index)">
              <div class="td">{{ item.custodian_name }}</div>
              <div class="td">
                <a v-if="!item.total" href="/" class="value" @click.prevent="selected(index)">{{ item.value | numeral }}</a>
                <span v-else>{{ item.value | numeral }}</span>
              </div>
            </div>
            <div class="collapse-content collapse-content--custodians">
              <div class="collapse-content-table">
                <custodian-item-chart :data="items[index]['asset']" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import CustodianItemChart from './CustodianItemChart'

export default {
  components: {
    CustodianItemChart,
  },
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
      console.log('--->')
      if (window.innerWidth < 768) {
        this.items[index]['active'] = !this.items[index]['active']
      }
    },
    selected(index) {
      this.index = index
    },
  },
}
</script>
