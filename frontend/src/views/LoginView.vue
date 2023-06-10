<template>
  <section>
    <div class="content">
      <img src="@/assets/img/fotoCadastro.svg" alt="">
      <div class="form-data">
        <div class="input input-text">
          <label for="usuario">Usuario:</label>
          <input v-model="usuario" type="text" name="usuario" id="usuario">
        </div>
        <div class="input input-password">
          <label for="senha">Senha:</label>
          <input v-model="senha" type="password" name="usuario" id="senha">
        </div>
        <div class="action">
          <button @click="login()" class="btn primary">Entrar</button>
          <button @click="$router.push('/cadastro')" class="btn primary">Cadastrar</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { logIn as verifyCredentials } from '@/api/login'
import { saveOnLocalStorage } from '@/util/setCookies'
export default {
  name: 'cadastroView',
  data: () => ({
    usuario: '',
    senha: ''
  }),
  methods: {
    async login () {
      const found = await verifyCredentials(this.usuario, this.senha)
      if (found) {
        this.$store.state.user.name = this.usuario
        this.$store.state.user.role = found.role
        if (found.role === 'professor') this.$store.state.user.idProfessor = found.idProfessor
        else this.$store.state.user.ra = found.ra
        this.$store.state.user.isLogged = true
        saveOnLocalStorage(this.$store.state)
        this.$router.push('/')
      }
    }
  }
}
</script>
<style scoped lang="scss">
.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 60px;
  gap: 16px;
  img {
    width: 200px;
  }
  .action {
    display: flex;
    gap: 14px;
  }
}
</style>
