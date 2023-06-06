import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import { getOnLocalStorage } from '@/util/setCookies'

import './assets/scss/app.scss'
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

if (getOnLocalStorage()) {
  console.log(getOnLocalStorage())
  store.replaceState({ ...getOnLocalStorage() })
} else router.push('/login')

Vue.config.errorHandler = (error) => {
  if (error.name === 'NavigationDuplicated') return true
  else throw new Error(error)
}
