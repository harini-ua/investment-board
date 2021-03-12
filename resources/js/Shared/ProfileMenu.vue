<template>
  <div v-click-outside="closeProfileMenu">
    <button class="user-account">
<!--      <div class="user-name"></div>-->
      <div class="icon-user" @click.prevent="show=!show">
        <img src="../../images/icon-user.png" alt="">
      </div>
<!--      Arrow icon-->
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
