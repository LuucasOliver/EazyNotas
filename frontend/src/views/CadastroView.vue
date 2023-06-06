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
        <div class="input input-dropdown">
          <label for="role">Você é:</label>
          <select v-model="role" name="role" id="role">
            <option value="professor">Professor</option>
            <option value="aluno">Aluno</option>
          </select>
        </div>
        <div class="action">
          <button @click="createUser" class="btn primary">Cadastrar</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { createProfessor } from '@api/professor'
export default {
  name: 'cadastroView',
  data: () => ({
    usuario: '',
    senha: '',
    role: 'professor'
  }),
  methods: {
    async createUser () {
      try {
        if (this.role === 'professor') await createProfessor(this.usuario, this.senha)
        return true
      } catch (error) {
        alert(error)
      }
    }
  }
}
</script>
<style scoped lang="scss">
.btn {
  background-color: #00A3FF;
  padding: 20px;
  border: none;
  color: #fff;
  border-radius: 8px;
  width: 100%;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: 0.4s;
  &:hover {
    background-color: #6ac8ff;
  }
}
.input {
  display: flex;
  flex-direction: column;
  gap: 4px;
  input, select, option {
    background-color: #dfdfdf;
    border: 1px solid #dfdfdf;
    border-radius: 12px;
    font-size: 16px;
    padding: 8px;
    &:focus {
      outline: none;
      border: 1px solid #ddd;
      border-color: #ddd;
    }
  }
  label {
    font-weight: bold;
  }
}
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
.form-data {
  display: flex;
  flex-direction: column;
  gap: 16px;
  width: 400px;
}
</style>
