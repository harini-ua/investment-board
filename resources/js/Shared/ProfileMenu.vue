<template>
  <div v-click-outside="closeProfileMenu">
    <button :class="[{ active : show }, 'user-account']" @click.prevent="show=!show">
      <div class="icon-user">
        <img src="../../images/icon-user.png" alt="">
      </div>
      <svg class="icon icon-arrow-down"><use xlink:href="#icon-arrow-down"></use></svg>
      <div v-if="show" class="logout-dropdown" @click.prevent="show=!show">
        <ul class="logout-dropdown__list">
          <li>Currency: {{ userCurrency }}</li>
          <li>
            <inertia-link :href="route('logout')" method="post"><svg class="icon icon-log-out"><use xlink:href="#icon-log-out"></use></svg> Logout</inertia-link>
          </li>
        </ul>
      </div>
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      show:  false,
    }
  },
  computed: {
    userCurrency: function () {
      return this.$page.auth.user.base_currency
    },
  },
  methods: {
    closeProfileMenu () {
      this.show = false
    },
  },
}
</script>
