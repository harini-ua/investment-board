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
          <div v-for="(item, i) in items"
               :key="item.id"
               class="tr-holder"
               :class="[{active: item.active}, 'row-' + (i + 1)]"
          >
            <div class="tr" @click="toggle(i)">
              <div class="td">
                <span @click.prevent="selected(i)">{{ item.custodian_name }}</span>
              </div>
              <div class="td">
                <inertia-link v-if="!item.total" :href="urlToDetails(index)" class="value" target="_blank">{{ item.value | numeral }}</inertia-link>
                <span v-else>{{ item.value | numeral }}</span>
              </div>
            </div>
            <div v-if="!item.total" class="collapse-content collapse-content--custodians">
              <div class="collapse-content-table">
                <custodian-item-chart :data="items[i]['asset']" />
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
      if (window.innerWidth < 768) {
        this.items[index]['active'] = !this.items[index]['active']
      }
    },
    urlToDetails(index) {
      let query = this.$parent.query
      query.custodian = this.items[index]['custodian_name']

      return this.route('details', Object.keys(query).length ? query : {})
    },
    selected(index) {
      if (!this.items[index]['total']) {
        this.index = index
      }
    },
  },
}
</script>
