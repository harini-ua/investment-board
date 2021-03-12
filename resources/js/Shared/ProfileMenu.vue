<template>
  <div v-click-outside="closeProfileMenu">
    <button :class="[{ active : show }, 'user-account']" @click.prevent="show=!show">
      <div class="icon-user">
        <img src="../../images/icon-user.png" alt="">
      </div>
      <svg class="icon icon-arrow-down"><use xlink:href="#icon-arrow-down"></use></svg>
      <div v-if="show" class="logout-dropdown" @click.prevent="show=!show">
        <inertia-link :href="route('logout')" method="post"><svg class="icon icon-log-out"><use xlink:href="#icon-log-out"></use></svg> Logout</inertia-link>
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
  methods: {
    closeProfileMenu () {
      this.show = false
    },
  },
}
</script>
