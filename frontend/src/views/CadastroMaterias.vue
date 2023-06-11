<template>
  <section>
    <div>
      <div class="title">{{ $store.state.user.name }}</div>
    </div>
    <div class="card">
      <div class="card-title">Matéria</div>
      <div class="card-subtitle">Cadastre suas matérias</div>
      <div class="form-data">
        <div class="input input-text">
          <label for="usuario">Nome:</label>
          <input v-model="nome" type="text" name="nome" id="nome">
        </div>
        <div class="input input-text">
          <label for="usuario">Dia:</label>
          <input v-model="dia" type="text" name="nome" id="nome">
        </div>
        <div class="input input-text">
          <label for="usuario">Horário:</label>
          <input v-model="horario" type="text" name="nome" id="nome">
        </div>
      </div>
      <div>
        <button @click="save()" class="btn primary">Salvar</button>
      </div>
    </div>
  </section>
</template>

<script>
import { createMaterias } from '@/api/materias'
export default {
  data: () => ({
    nome: '',
    dia: '',
    horario: ''
  }),
  methods: {
    async save () {
      await createMaterias(
        this.nome,
        this.$store.state.user.idProfessor,
        this.dia,
        this.horario
      )
      this.$router.push('/materia')
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
