<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title table-title--currency-hedging">Currency Hedging</h3>
      <div class="table table--currency-hedging">
        <div class="thead">
          <div class="tr">
            <div class="td">Currency</div>
            <div class="td">Gross Assets</div>
            <div class="td">FX Forwards</div>
            <div class="td hidden-lg">Net Assets</div>
          </div>
        </div>
        <div class="tbody">
          <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
            <div class="tr">
              <div class="td">EUR</div>
              <div class="td">47,0%</div>
              <div class="td hidden-sm">8,6%</div>
              <div class="td hidden-lg">55,6%</div>
            </div>
            <div class="collapse-content collapse-content--general visible-lg">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">USD</div>
              <div class="td">42,9%</div>
              <div class="td hidden-sm">42,9%</div>
              <div class="td hidden-lg">42,9%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">GBP</div>
              <div class="td">4,7%</div>
              <div class="td hidden-sm">0,0%</div>
              <div class="td hidden-lg">4,7%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">NOK</div>
              <div class="td">2,7%</div>
              <div class="td hidden-sm">0,0%</div>
              <div class="td hidden-lg">2,7%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">SEK</div>
              <div class="td">0,3%</div>
              <div class="td hidden-sm">0,0%</div>
              <div class="td hidden-lg">0,3%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">CAD</div>
              <div class="td">0,1%</div>
              <div class="td hidden-sm">0,0%</div>
              <div class="td hidden-lg">0,1%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">HKD</div>
              <div class="td">0,0%</div>
              <div class="td hidden-sm">-12,7%</div>
              <div class="td hidden-lg">-12,7%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Total</div>
              <div class="td">99,4%</div>
              <div class="td hidden-sm">0,6%</div>
              <div class="td hidden-lg">100,0%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">42,9%</div>
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
  data: function () {
    return {
      isActive: false,
    }
  },
  methods: {
    openHiddenContent: function() {
      let ViewportWidth = window.innerWidth;

      if (ViewportWidth < 1024) {
        this.isActive = !this.isActive;
      }
    },
  }
}
</script>
