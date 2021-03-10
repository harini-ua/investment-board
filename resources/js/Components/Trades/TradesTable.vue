<template>
  <div>
    <div class="block-table">
      <div class="table-holder">
        <h3 class="table-title">Trades</h3>
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
      return this.items.reduce((prev, cur) => prev + cur.quantity, 0)
    },
  },
  methods: {
    toggle(index) {
      this.items[index]['active'] = !this.items[index]['active']
    },
  },
}
</script>
