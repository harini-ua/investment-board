<template>
  <div class="wrapper">
    <header class="header">
      <div class="container">
        <div class="header-holder">
          <a :href="route('overview')"><logo /></a>
          <div class="header-right-bar">
            <main-menu :url="url()" />
            <profile-menu />
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

import FlashMessages from '@/Shared/FlashMessages'
import Logo from '@/Shared/Logo'
import MainMenu from '@/Shared/MainMenu'
import FooterMenu from './FooterMenu'
import ProfileMenu from './ProfileMenu'

export default {
  components: {
    ProfileMenu,
    FooterMenu,
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
  methods: {
    url() {
      return location.pathname.substr(1)
    },
  },
}
</script>
