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
    component: () => import(/* webpackChunkName: "home" */ '../views/HomeView.vue')
  },
  {
    path: '/turma',
    name: 'turmas',
    component: () => import(/* webpackChunkName: "turmas" */ '../views/TurmasView.vue')
  },
  {
    path: '/nota',
    name: 'notas',
    component: () => import(/* webpackChunkName: "nota" */ '../views/NotasView.vue')
  },
  {
    path: '/nota/:id',
    name: 'cadastroNota',
    component: () => import(/* webpackChunkName: "nota" */ '../views/CadastroNotas.vue')
  },
  {
    path: '/materia',
    name: 'materias',
    component: () => import(/* webpackChunkName: "materias" */ '../views/MateriasView.vue')
  },
  {
    path: '/materia/:id',
    name: 'cadastroMaterias',
    component: () => import(/* webpackChunkName: "materias" */ '../views/CadastroMaterias.vue')
  },
  {
    path: '/turma/:id',
    name: 'turma',
    props: true,
    component: () => import(/* webpackChunkName: "turmas" */ '../views/CadastroTurma.vue')
  },
  {
    path: '/login',
    name: 'login',
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
