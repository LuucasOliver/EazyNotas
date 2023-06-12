<template>
  <section>
    <div>
      <div class="title">{{ $store.state.user.name }}</div>
    </div>
    <div class="card">
      <div class="card-subtitle">Cadastre notas</div>
      <div class="form-data">
        <div class="input input-dropdown">
          <label for="role">Aluno</label>
          <select v-model="ra" name="aluno" id="aluno">
            <option
              v-for="aluno in alunos"
              :key="aluno.rA"
              :value="aluno.rA"
            >
              {{ aluno.nome }}
            </option>
          </select>
        </div>
        <div class="input input-dropdown">
          <label for="role">Matéria</label>
          <select v-model="selectedMateria" name="materia" id="materia">
            <option
              v-for="materia in materias"
              :key="materia.idMateria"
              :value="materia.idMateria"
            >
              {{ materia.nomeMat }}
            </option>
          </select>
        </div>
        <div class="input input-text">
          <label for="usuario">P1:</label>
          <input v-model="p1" type="text" name="P1" id="P1">
        </div>
        <div class="input input-text">
          <label for="usuario">P2:</label>
          <input v-model="p2" type="text" name="P2" id="P2">
        </div>
        <div class="input input-text">
          <label for="usuario">Rec:</label>
          <input v-model="rec" type="text" name="rev" id="rec">
        </div>
      </div>
      <div>
        <button @click="save()" class="btn primary">Salvar</button>
      </div>
    </div>
  </section>
</template>

<script>
import { getAllMaterias } from '@/api/materias'
import { getAllAlunos } from '@/api/aluno'
import { createNota } from '@/api/notas'

export default {
  data: () => ({
    ra: '',
    p1: '',
    p2: '',
    rec: '',
    selectedMateria: '',
    materias: [],
    alunos: []
  }),
  async mounted () {
    [this.materias, this.alunos] = await Promise.all([
      getAllMaterias(),
      getAllAlunos()
    ])
  },
  methods: {
    async save () {
      await createNota(
        this.ra,
        this.selectedMateria,
        this.p1,
        this.p2,
        this.rec
      )
      this.$router.push('/nota')
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
