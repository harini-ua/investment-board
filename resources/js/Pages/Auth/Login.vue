<template>
  <div class="login-bg" style="background-image: url('../../images/login-bg.jpg')">
    <div class="login-block">
      <logo/>
      <div class="login-block__form">
        <span class="login-block__title">Login</span>
        <form @submit.prevent="submit">
          <text-input
            v-model="form.email"
            :error="errors.email"
            label="Email"
            type="email"
            autofocus autocapitalize="off" />
          <text-input
            v-model="form.password"
            label="Password"
            type="password"
          />
          <loading-button
            :loading="sending"
            type="submit"
          >Login</loading-button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import LoadingButton from '@/Shared/LoadingButton'
import Logo from '@/Shared/Logo'
import TextInput from '@/Shared/TextInput'

export default {
  metaInfo: { title: 'Login' },
  components: {
    LoadingButton,
    Logo,
    TextInput,
  },
  props: {
    errors: Object,
  },
  data() {
    return {
      sending: false,
      form: {
        email: 'admin@example.com',
        password: 'secret',
      },
    }
  },
  methods: {
    submit() {
      const data = {
        email: this.form.email,
        password: this.form.password,
      }

      this.$inertia.post(this.route('login.attempt'), data, {
        onStart: () => this.sending = true,
        onFinish: () => this.sending = false,
      })
    },
  },
}
</script>
