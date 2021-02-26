<template>
  <nav class="nav-drop">
      <ul class="menu-list">
          <li>
              <inertia-link :href="route('overview')"><svg class="icon icon-home"><use xlink:href="#icon-home"></use></svg>Overview</inertia-link>
          </li>
          <li>
              <inertia-link :href="route('custodian')"><svg class="icon icon-custodian"><use xlink:href="#icon-custodian"></use></svg>Custodian</inertia-link>
          </li>
          <li>
              <inertia-link :href="route('currency')"><svg class="icon icon-currency"><use xlink:href="#icon-currency"></use></svg>Currency</inertia-link>
          </li>
          <li>
              <inertia-link :href="route('details')"><svg class="icon icon-details"><use xlink:href="#icon-details"></use></svg>Details</inertia-link>
          </li>
          <li>
              <inertia-link :href="route('trades')"><svg class="icon icon-trades"><use xlink:href="#icon-trades"></use></svg>Trades</inertia-link>
          </li>
      </ul>
  </nav>
</template>

<script>

export default {
  props: {
    url: String,
  },
  methods: {
    isUrl(...urls) {
      if (urls[0] === '') {
        return this.url === ''
      }

      return urls.filter(url => this.url.startsWith(url)).length
    },
  },
}
</script>
