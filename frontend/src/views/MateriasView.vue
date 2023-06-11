<template>
  <section>
    <div style="display:flex; justify-content:space-between">
      <div class="title">{{ $store.state.user.name }}</div>
      <div>
        <button @click="$router.push('/materia/nova')" class="btn primary">Nova Materia</button>
      </div>
    </div>
    <div class="card">
      <div class="card-title">Matérias:</div>
      <table>
        <thead>
          <th>Nome</th>
          <th>Professor</th>
          <th>Data de Aula</th>
          <th>Horário</th>
        </thead>
        <tbody>
          <tr v-for="(materia, index) in materias" :key="index">
            <td>{{ materia.nomeMat }}</td>
            <td>{{ professores.find(professor => professor.idProfessor === materia.idProfessor).nome }}</td>
            <td>{{ materia.diaMateria }}</td>
            <td>{{ materia.horarioAula }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script>
import { getAllMaterias } from '@/api/materias'
import { getAllProfessor } from '@/api/professor'
export default {
  data: () => ({
    materias: [],
    professores: []
  }),
  async mounted () {
    [this.materias, this.professores] = await Promise.all([
      getAllMaterias(),
      getAllProfessor()
    ])
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
