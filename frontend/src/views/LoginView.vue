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
          <button class="btn primary">Entrar</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'cadastroView',
  data: () => ({
    usuario: '',
    senha: ''
  })
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
}
</style>
