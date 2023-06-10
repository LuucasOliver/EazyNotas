<template>
  <div class="side-menu">
    <div class="logo">
      <img src="@images/logo.png" alt="">
    </div>
    <div class="menu-itens">
      <div class="menu-itens-content">
        <div
          v-if="$store.state.user.role === 'professor'"
          class="item"
          @click="$router.push('/turma')"
        >
          <div class="icon">
            <img src="@images/plateboard.png" alt="">
          </div>
          <div class="label">TURMA</div>
        </div>
        <div
          class="item"
          v-if="$store.state.user.role === 'professor'"
          @click="$router.push('/materia')"
        >
          <div class="icon">
            <img src="@images/turmas.png" alt="">
          </div>
          <div class="label">MATERIAS</div>
        </div>
        <div class="item"
          @click="$router.push('/nota')"
          v-if="$store.state.user.role === 'professor'"
        >
          <div class="icon">
            <img src="@images/turmas.png" alt="">
          </div>
          <div class="label">NOTA</div>
        </div>
      </div>
      <div class="footer">
        <div class="item" @click="logOut">
          <div class="icon">
            <img src="@images/logout.png" alt="">
          </div>
        <div class="label">Sair</div>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
import { removeLocalStorage } from '@/util/setCookies'
export default {
  methods: {
    logOut () {
      removeLocalStorage()
      this.$store.state.user.isLogged = false
      this.$router.push('/login')
    }
  }
}
</script>
<style lang="scss" scoped>
.menu-itens {
  color: #fff;
  font-weight: bold;
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  .menu-itens-content {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }
  .item {
    transition: 0.4s;
    display: flex;
    gap: 18px;
    align-items: center;
    padding: 14px;
    border-radius: 4px;
    cursor: pointer;
    &:hover {
      background-color: #6ac8ff;
    }
  }
}
.side-menu {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  background-color: #38B6FF;
  width: 254px;
}
</style>
