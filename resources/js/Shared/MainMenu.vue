<template>
  <nav class="nav-drop">
    <ul class="menu-list">
      <li>
        <inertia-link 
          :href="route('overview')"
          :class="{ active: isUrl('') }"
        >
          <svg class="icon icon-home"><use xlink:href="#icon-home" /></svg>Overview
        </inertia-link>
      </li>
      <li>
        <inertia-link
          :href="route('custodian')"
          :class="{ active: isUrl('custodian') }"
        >
          <svg class="icon icon-custodian"><use xlink:href="#icon-custodian" /></svg>Custodian
        </inertia-link>
      </li>
      <li>
        <inertia-link
          :href="route('currency')"
          :class="{ active: isUrl('currency') }"
        >
          <svg class="icon icon-currency"><use xlink:href="#icon-currency" /></svg>Currency
        </inertia-link>
      </li>
      <li>
        <inertia-link
          :href="route('details')"
          :class="{ active: isUrl('details') }"
        >
          <svg class="icon icon-details"><use xlink:href="#icon-details" /></svg>Details
        </inertia-link>
      </li>
      <li>
        <inertia-link
          :href="route('trades')"
          :class="{ active: isUrl('trades') }"
        >
          <svg class="icon icon-trades"><use xlink:href="#icon-trades" /></svg>Trades
        </inertia-link>
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
