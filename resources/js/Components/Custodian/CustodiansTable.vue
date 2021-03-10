<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title table-title--custodians">Custodians</h3>
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
               @click="toggle(index)"
          >
            <div class="td">{{ item.custodian_name }}</div>
            <div class="td">{{ item.value | numeral }}</div>
            <div class="collapse-content collapse-content--custodians">
              <div class="collapse-content-table">
                <div class="row">
<!--                  cart-->
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
}
</script>
