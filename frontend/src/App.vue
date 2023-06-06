<template>
  <div id="app">
    <SideMenu v-if="isLogged"/>
    <router-view class="content"/>
  </div>
</template>
<script>
import SideMenu from './components/SideMenu.vue'
export default {
  components: {
    SideMenu
  },
  computed: {
    isLogged () {
      return this.$store.state.user.isLogged
    }
  },
  data: () => ({

  })
}
</script>
<style lang="scss" scoped>
  .content {
    padding: 32px;
    width: 100%;
  }
</style>
