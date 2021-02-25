<template>
  <div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('overview')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('overview') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Overview</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('custodian')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('custodian') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('custodian') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Custodian</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('currency')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('currency') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('currency') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Currency</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('details')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('details') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('details') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Details</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('trades')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('trades') ? 'fill-white' : 'fill-indigo-400 group-hover:fill-white'" />
        <div :class="isUrl('trades') ? 'text-white' : 'text-indigo-300 group-hover:text-white'">Trades</div>
      </inertia-link>
    </div>
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'

export default {
  components: {
    Icon,
  },
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
