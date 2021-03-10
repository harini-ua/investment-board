<template>
  <div class="wrapper">
    <portal-target name="dropdown" slim />

    <header class="header">
      <div class="container">
        <div class="header-holder">
          <a :href="route('overview')"><logo /></a>
          <div class="header-right-bar">
            <main-menu :url="url()" />
            <dropdown>
              <div slot="dropdown" class="logout-dropdown">
                <inertia-link :href="route('logout')" method="post"><svg class="icon icon-log-out"><use xlink:href="#icon-log-out"></use></svg> Logout</inertia-link>
              </div>
            </dropdown>
          </div>
        </div>
      </div>
    </header>

    <main>
      <div>
        <flash-messages />
        <slot />
      </div>
    </main>

    <footer class="footer">
      <div class="container">
        <main-menu :url="url()" />
        <div class="footer-holder">
          <p>Key Family Partners © {{ new Date().getFullYear() }} All rights reserved.</p>
          <footer-menu :url="url()" />
        </div>
      </div>
    </footer>

  </div>
</template>

<script>
import Dropdown from '@/Shared/Dropdown'
import FlashMessages from '@/Shared/FlashMessages'
import Logo from '@/Shared/Logo'
import MainMenu from '@/Shared/MainMenu'
import FooterMenu from './FooterMenu'

export default {
  components: {
    FooterMenu,
    Dropdown,
    FlashMessages,
    Logo,
    MainMenu,
  },
  data() {
    return {
      showUserMenu: false,
      accounts: null,
    }
  },
  created() {
    window.addEventListener(
      'resize',
      () => this.$store.commit('setWindowWidth')
    )
    window.addEventListener(
      'resize',
      () => this.$store.commit('setWindowHeight')
    )
  },
  methods: {
    url() {
      return location.pathname.substr(1)
    },
    hideDropdownMenus() {
      this.showUserMenu = false
    },
  },
}
</script>
