import Vue from 'vue'
import Vuex from 'vuex'
import VueMeta from 'vue-meta'
import { InertiaApp } from '@inertiajs/inertia-vue'
import { InertiaProgress } from '@inertiajs/progress/src'
import VueApexCharts from 'vue-apexcharts'
import filters from './plugins/filters'

Vue.config.productionTip = false
Vue.mixin({ methods: { route: window.route } })
Vue.use(InertiaApp)
Vue.use(VueMeta)

Vue.use(Vuex)

import vSelect from "vue-select";
Vue.component("v-select", vSelect);

import vClickOutside from 'v-click-outside'
Vue.use(vClickOutside)

Vue.use(VueApexCharts)
Vue.component('apexchart', VueApexCharts)

InertiaProgress.init()

let app = document.getElementById('app')

const store = new Vuex.Store({
  state: {
    palettes: {
      palette1: ['#008FFB', '#00E396', '#FEB019', '#662E9B', '#FF4560'],
      palette2: ['#3F51B5', '#03A9F4', '#4CAF50', '#F9CE1D', '#FF9800'],
      palette3: ['#33B2DF', '#546E7A', '#D4526E', '#13D8AA', '#A5978B'],
      palette4: ['#4ECDC4', '#C7F464', '#81D4FA', '#546E7A', '#FD6A6A'],
      palette5: ['#2B908F', '#F9A3A4', '#90EE7E', '#FA4443', '#69D2E7'],
      palette6: ['#449DD1', '#F86624', '#EA3546', '#662E9B', '#C5D86D'],
      palette7: ['#D7263D', '#1B998B', '#2E294E', '#F46036', '#E2C044'],
      palette8: ['#662E9B', '#F86624', '#F9C80E', '#EA3546', '#43BCCD'],
      palette9: ['#5C4742', '#A5978B', '#8D5B4C', '#5A2A27', '#C4BBAF'],
      palette10: ['#A300D6', '#7D02EB', '#5653FE', '#2983FF', '#00B1F2'],
    },
    chartColor: [
      ...['#449DD1', '#F86624', '#EA3546', '#662E9B', '#C5D86D'], // 6
      ...['#D7263D', '#1B998B', '#2E294E', '#F46036', '#E2C044'], // 7
      ...['#008FFB', '#00E396', '#FEB019', '#662E9B', '#FF4560'], // 1
    ],
  }
})

Object.keys(filters).forEach(key => Vue.filter(key, filters[key]))

new Vue({
  store,
  metaInfo: {
    titleTemplate: (title) => title ? `${title} - KFP` : 'KFP - Key Family Partners'
  },
  render: h => h(InertiaApp, {
    props: {
      initialPage: JSON.parse(app.dataset.page),
      resolveComponent: name => import(`@/Pages/${name}`).then(module => module.default),
    },
  }),
}).$mount(app)
