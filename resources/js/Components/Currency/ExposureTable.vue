 <template>
   <div class="block-table block-table--currency-exposure">
     <div class="table-holder">
       <h3 class="table-title table-title--currency-exposure">Currency Exposure</h3>
       <div class="table table--currency-exposure">
         <div class="thead">
           <div class="tr">
             <div class="td">Currency</div>
             <div class="td">Cash</div>
             <div class="td hidden-sm">Investments</div>
             <div class="td hidden-lg">FX Forwards</div>
             <div class="td hidden-lg">Total</div>
           </div>
         </div>
         <div class="tbody">
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
           <div :class="[{active: isActive}, 'tr-holder']" @click="openHiddenContent()">
             <div class="tr">
               <div class="td">EUR</div>
               <div class="td">4 738 496</div>
               <div class="td hidden-sm">36 473 412</div>
               <div class="td hidden-lg">7 556 976</div>
               <div class="td hidden-lg">48 768 884</div>
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
         </div>
       </div>
     </div>
   </div>
</template>

<script>

export default {
  data: function () {
    return {
      title: 'Currency Exposure',
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
