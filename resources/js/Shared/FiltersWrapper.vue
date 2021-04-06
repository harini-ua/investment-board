<template>
  <div class="welcome-block">
    <div class="welcome-block__content">
      <h1>Welcome, {{ fullName }}</h1>
      <p>{{ description }}</p>
    </div>
    <div class="welcome-block__row-actions">
      <slot />
    </div>
  </div>
</template>

<script>

export default {
  props: {
    description: String,
  },
  computed: {
    fullName: function () {
      return this.$page.auth.user.first_name + ' ' + this.$page.auth.user.last_name
    },
  },
}
</script>
