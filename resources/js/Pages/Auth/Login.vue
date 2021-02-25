<template>
  <div>
    <div>
      <logo/>

      <form @submit.prevent="submit">
        <div>
          <h1>Login</h1>
          <text-input v-model="form.email" :error="errors.email" label="Email" type="email" autofocus autocapitalize="off" />
          <text-input v-model="form.password" label="Password" type="password" />
          <loading-button :loading="sending" type="submit">Login</loading-button>
        </div>
      </form>
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
        remember: null,
      },
    }
  },
  methods: {
    submit() {
      const data = {
        email: this.form.email,
        password: this.form.password,
        remember: this.form.remember,
      }

      this.$inertia.post(this.route('login.attempt'), data, {
        onStart: () => this.sending = true,
        onFinish: () => this.sending = false,
      })
    },
  },
}
</script>
