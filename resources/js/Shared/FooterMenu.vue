<template>
  <div>
    <ul class="footer__right-bar">
      <li>
        <inertia-link
          :href="route('page.privacy')"
          :class="{ active: isUrl('privacy') }"
          method="get"
        >
          Privacy policy
        </inertia-link>
      </li>
      <li>
        <inertia-link
          :href="route('page.terms')"
          :class="{ active: isUrl('terms') }"
          method="get"
        >
          Terms & conditions
        </inertia-link>
      </li>
    </ul>
  </div>
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
