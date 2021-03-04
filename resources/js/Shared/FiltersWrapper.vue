<template>
  <div class="welcome-block">
    <div class="welcome-block__content">
      <h1>Welcome, {{ fullName }}</h1>
      <p>Please pick the date range, base currency, asset class, custodians and account if you need a custom consolidated summary.</p>
    </div>
    <div class="welcome-block__row-actions">
      <slot />
    </div>
  </div>
</template>

<script>

export default {
  computed: {
    fullName: function () {
      return this.$page.auth.user.first_name + ' ' + this.$page.auth.user.last_name
    },
  },
}
</script>
