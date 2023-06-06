<template>
  <section>
    <div>
      <div class="title">{{ $store.state.user.name }}</div>
    </div>
    <div class="card">
      <div class="card-title``">Turma</div>
      <div class="card-subtitle">Cadastre sua turma</div>
      <div class="form-data">
        <div class="input input-text">
          <label for="usuario">Nome:</label>
          <input v-model="nome" type="text" name="nome" id="nome">
        </div>
      </div>
      <div>
        <button @click="save()" class="btn primary">Salvar</button>
      </div>
    </div>
  </section>
</template>

<script>
import { createTurma } from '@/api/turma'
export default {
  data: () => ({
    nome: ''
  }),
  methods: {
    async save () {
      await createTurma(this.nome, this.$store.state.user.idProfessor)
      this.$router.push('/turma')
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
