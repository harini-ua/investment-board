<template>
    <div class="wrapper">
        <portal-target name="dropdown" slim />
<!--        <div @click="hideDropdownMenus">-->
        <header class="header">
            <div class="container">
                <div class="header-holder">
                    <logo />
                    <div class="header-right-bar">
                        </inertia-link>
                        <main-menu :url="url()"/>
                        <dropdown>
                            <span class="user user-first-name">{{ $page.auth.user.first_name }}</span>
                            <span class="user user-last-name">{{ $page.auth.user.last_name }}</span>
                            <div slot="dropdown" class="mt-2 py-2 shadow-xl bg-white rounded text-sm">
                                <inertia-link :href="route('logout')" method="post">Logout</inertia-link>
                            </div>
                        </dropdown>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <div  scroll-region>
                <flash-messages />
                <slot />
            </div>
        </main>
        <footer class="footer">
            <div class="container">
                <main-menu :url="url()"/>
                <div class="footer-holder">
                    <p>Key Family Partners © 2021 All rights reserved.</p>
                    <ul class="footer__right-bar">
                        <li><a href="#">Privacy policy</a></li>
                        <li><a href="#">Terms & conditions</a></li>
                    </ul>
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

export default {
  components: {
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
