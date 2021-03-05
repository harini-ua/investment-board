<template>
  <div class="block-table">
    <div class="table-holder">
      <h3 class="table-title">Open positions</h3>
      <div class="table table--open-position">
        <div class="thead">
          <div class="tr">
            <div class="td">Name</div>
            <div class="td">Units</div>
            <div class="td">Last Purchase</div>
            <div class="td">CCY</div>
            <div class="td">Cost Price</div>
            <div class="td">Valuation Price</div>
            <div class="td">Cost Local</div>
            <div class="td">Value Local</div>
            <div class="td">Value Base</div>
            <div class="td">P&L MTD</div>
            <div class="td">P&L YTD</div>
            <div class="td">% MTD</div>
            <div class="td">% YTD</div>
            <div class="td">% Since Purchase</div>
          </div>
        </div>
        <div class="tbody">
          <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">Units</div>
                  <div class="cell-description">250 000</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Last Purchase</div>
                  <div class="cell-description">50.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">CCY</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Cost Price</div>
                  <div class="cell-description">1,0115</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Valuation Price</div>
                  <div class="cell-description">0,9956</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Cost Local</div>
                  <div class="cell-description">252 883</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Value Local</div>
                  <div class="cell-description">5248 898</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Value Base</div>
                  <div class="cell-description">211 264</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">P&L MTD</div>
                  <div class="cell-description">-3 813 </div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">P&L YTD</div>
                  <div class="cell-description">-14 726 </div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% MTD</div>
                  <div class="cell-description">3,01%</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% YTD</div>
                  <div class="cell-description">-1,79%</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% Since Purchase</div>
                  <div class="cell-description">-1,58%</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Interest</div>
                  <div class="cell-description">50.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Dividend</div>
                  <div class="cell-description">75.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">200.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">100.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Total</div>
                  <div class="cell-description">425.0</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250 000</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">Units</div>
                  <div class="cell-description">250 000</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Last Purchase</div>
                  <div class="cell-description">50.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">CCY</div>
                  <div class="cell-description">USD</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Cost Price</div>
                  <div class="cell-description">1,0115</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Valuation Price</div>
                  <div class="cell-description">0,9956</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Cost Local</div>
                  <div class="cell-description">252 883</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Value Local</div>
                  <div class="cell-description">5248 898</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Value Base</div>
                  <div class="cell-description">211 264</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">P&L MTD</div>
                  <div class="cell-description">-3 813 </div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">P&L YTD</div>
                  <div class="cell-description">-14 726 </div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% MTD</div>
                  <div class="cell-description">3,01%</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% YTD</div>
                  <div class="cell-description">-1,79%</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">% Since Purchase</div>
                  <div class="cell-description">-1,58%</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Interest</div>
                  <div class="cell-description">50.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Dividend</div>
                  <div class="cell-description">75.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">200.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">100.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Total</div>
                  <div class="cell-description">425.0</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row visible-lg">
                  <div class="cell-thead">Net Assets</div>
                  <div class="cell-description">55,6%</div>
                </div>
                <div class="cell-row visible-md">
                  <div class="cell-thead">FX Forwards</div>
                  <div class="cell-description">8,6%</div>
                </div>
              </div>
            </div>
          </div>
          <div class="tr-holder">
            <div class="tr">
              <div class="td">ADANI PORTS [PIG]</div>
              <div class="td">250</div>
              <div class="td">11/12/2019</div>
              <div class="td">USD</div>
              <div class="td">1,0115</div>
              <div class="td">0,9956</div>
              <div class="td">252 883</div>
              <div class="td">248 898</div>
              <div class="td">211 264</div>
              <div class="td">-3 813</div>
              <div class="td">-14 726</div>
              <div class="td">3,01%</div>
              <div class="td">-1,79%</div>
              <div class="td">-1,58%</div>
            </div>
            <div class="collapse-content collapse-content--general">
              <div class="collapse-content-table">
                <div class="cell-row">
                  <div class="cell-thead">Interest</div>
                  <div class="cell-description">50.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Dividend</div>
                  <div class="cell-description">75.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Commissions</div>
                  <div class="cell-description">200.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Tax</div>
                  <div class="cell-description">100.0</div>
                </div>
                <div class="cell-row">
                  <div class="cell-thead">Total</div>
                  <div class="cell-description">425.0</div>
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
      this.isActive = !this.isActive
    },
  },
}
</script>
