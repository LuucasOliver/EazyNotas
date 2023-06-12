<template>
  <section>
    <div style="display:flex; justify-content:space-between">
      <div class="title">{{ $store.state.user.name }}</div>
      <div>
        <button v-if="$store.state.user.role === 'professor'" @click="$router.push('/nota/nova')" class="btn primary">Nova nota</button>
      </div>
    </div>
    <div class="card">
      <div class="card-title">Notas:</div>
      <table>
        <thead>
          <th>Disciplinas</th>
          <th v-if="$store.state.user.role === 'professor'">Aluno</th>
          <th>p1</th>
          <th>p2</th>
          <th>Rec</th>
        </thead>
        <tbody>
          <tr v-for="(nota, index) in notas" :key="index">
            <td>{{ materias.find(materia => materia.idMateria === nota.idMateria).nomeMat }}</td>
            <td v-if="$store.state.user.role === 'professor'">{{ alunos.find(aluno => aluno.rA === nota.rA).nome }}</td>
            <td>{{ nota.notaP1 }}</td>
            <td>{{ nota.notaP2 }}</td>
            <td>{{ nota.notaRc }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script>
import { getAllNotas } from '@/api/notas'
import { getAllMaterias } from '@/api/materias'
import { getAllAlunos } from '@/api/aluno'
export default {
  data: () => ({
    notas: [],
    alunos: [],
    materias: []
  }),
  async mounted () {
    [
      this.notas,
      this.materias,
      this.alunos
    ] = await Promise.all([
      getAllNotas(),
      getAllMaterias(),
      getAllAlunos()
    ])

    this.notas = this.notas.filter(nota => {
      if (nota.ra === this.$store.state.usuario.ra) return true
      return false
    })
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
