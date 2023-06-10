import Vue from 'vue'
import VueRouter from 'vue-router'
import { getOnLocalStorage } from '@/util/setCookies'

Vue.use(VueRouter)

const routes = [
  {
    path: '/cadastro',
    name: 'cadastro',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "cadastro" */ '../views/CadastroView.vue')
  },
  {
    path: '/',
    name: 'home',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "home" */ '../views/HomeView.vue')
  },
  {
    path: '/turma',
    name: 'turmas',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "turmas" */ '../views/TurmasView.vue')
  },
  {
    path: '/nota',
    name: 'notas',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "turmas" */ '../views/NotasView.vue')
  },
  {
    path: '/materia',
    name: 'materias',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "materias" */ '../views/MateriasView.vue')
  },
  {
    path: '/turma/:id',
    name: 'turma',
    props: true,
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "turmas" */ '../views/CadastroTurma.vue')
  },
  {
    path: '/login',
    name: 'login',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "login" */ '../views/LoginView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (['cadastro', 'login'].includes(to.name)) next()
  else if (!getOnLocalStorage()) router.push('/login')
  else next()
})
export default router
