<template>
  <div v-click-outside="closeProfileMenu">
    <div class="user-account">
<!--      <div class="user-name"></div>-->
      <div class="icon-user" @click.prevent="show=!show">
        <img src="../../images/icon-user.png" alt="">
      </div>
<!--      Arrow icon-->
      <div v-if="show" class="">
        <ul class="">
          <li class="" @click.prevent="show=!show">
            <inertia-link :href="route('logout')" method="post"><svg class="icon icon-log-out"><use xlink:href="#icon-log-out"></use></svg> Logout</inertia-link>
          </li>
        </ul>
      </div>
    </div>
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
