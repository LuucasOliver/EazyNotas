<template>
  <div id="app">
    <SideMenu />
    <router-view/>
  </div>
</template>
<script>
import SideMenu from './components/SideMenu.vue'
export default {
  components: {
    SideMenu
  },
  data: () => ({

  })
}
</script>
