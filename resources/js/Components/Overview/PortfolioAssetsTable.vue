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
          <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
            <div class="tr">
              <div class="td">Cash</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Equity</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">KFP Equity </div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Bond</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">KFP Bond</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Hedge Fund</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Commodity</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Cash</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Private Equity</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Real Estate</div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">Total </div>
              <div class="td"><a href="#" class="value">15 957 949</a></div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-sm">(200 889)</div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
                </div>
              </div>
              <div class="td hidden-lg">
                <div class="double-value-holder">
                  <span class="double-value">-1.26%</span>
                  <span class="double-value">5.21%</span>
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
                  <div class="cell">149 811</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-md">
                  <div class="cell cell-description">P&L YTD</div>
                  <div class="cell">(2 013 957)</div>
                  <div class="cell"></div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% MTD</div>
                  <div class="cell">0.72%</div>
                  <div class="cell">5.21%</div>
                </div>
                <div class="row visible-lg">
                  <div class="cell cell-description">% YTD</div>
                  <div class="cell">-5.51%</div>
                  <div class="cell">-1.50%</div>
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
