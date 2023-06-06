<template>
  <section>
    <div style="display:flex; justify-content:space-between">
      <div class="title">{{ $store.state.user.name }}</div>
      <div>
        <button @click="$router.push('/turma/nova')" class="btn primary">Nova Turma</button>
      </div>
    </div>
    <div class="card">
      <div class="card-title">Turmas:</div>
      <table>
        <thead>
          <th>Turma</th>
          <th>Professor</th>
        </thead>
        <tbody>
          <tr v-for="(turma, index) in turmas" :key="index">
            <td>{{ turma.sala }}</td>
            <td>{{ professores.find(professor => professor.idProfessor === turma.idProfessor).nome }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script>
import { getAllTurma } from '@/api/turma'
import { getAllProfessor } from '@/api/professor'
export default {
  data: () => ({
    turmas: [],
    professores: []
  }),
  async mounted () {
    const [turmas, professores] = await Promise.all([
      getAllTurma(),
      getAllProfessor()
    ])
    this.turmas = turmas
    this.professores = professores
  },
  methods: {}
}
</script>

<style lang="scss" scoped>
  section {
    display: flex;
    flex-direction: column;
    gap: 14px;
  }
  table {
    border-collapse: collapse;
    td, th { padding: 15px; }
    tbody {
      tr {
        border-bottom: 1px solid #c1c1c1;
      }
    }
  }
  .title {
    font-weight: bold;
    font-size: 32px;
  }
  .card {
    .card-title {
      font-size: 24px;
    }
    display: flex;
    flex-direction: column;
    text-align: left;
    background: #FFFFFF;
    padding: 32px;
    border: 1px solid #E5E5E5;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 4px;
    font-weight: bold;
    gap: 32px;
  }
</style>
