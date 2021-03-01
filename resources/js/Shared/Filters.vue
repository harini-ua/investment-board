<template>
  <div>
    <h1>Welcome, {{ $page.auth.user.first_name }} {{ $page.auth.user.last_name }}</h1>
    <p>Please pick the date range, base currency, asset class, custodians and account if you need a custom consolidated summary.</p>
    <slot />
  </div>
</template>

<script>

export default {

}
</script>
