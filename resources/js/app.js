import Vue from 'vue'
import Vuex from 'vuex'
import VueMeta from 'vue-meta'
import PortalVue from 'portal-vue'
import { InertiaApp } from '@inertiajs/inertia-vue'
import { InertiaProgress } from '@inertiajs/progress/src'
import VueApexCharts from 'vue-apexcharts'

Vue.config.productionTip = false
Vue.mixin({ methods: { route: window.route } })
Vue.use(InertiaApp)
Vue.use(PortalVue)
Vue.use(VueMeta)

Vue.use(Vuex)

Vue.use(VueApexCharts)
Vue.component('apexchart', VueApexCharts)

InertiaProgress.init()

let app = document.getElementById('app')

const store = new Vuex.Store({
  state: {
    windowWidth: window.innerWidth,
    windowHeight: window.innerHeight,
  },
  mutations: {
    setWindowWidth(state) {
      state.windowHeight = window.innerHeight;
    },
    setWindowHeight(state) {
      state.windowHeight = window.innerHeight;
    }
  },
})

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
