<template>
  <section>
    <div style="display:flex; justify-content:space-between">
      <div class="title">{{ $store.state.user.name }}</div>
    </div>
    <div class="card">
      <div class="card-title">Notas:</div>
      <table>
        <thead>
          <th>Disciplinas</th>
          <th>p1</th>
          <th>p2</th>
          <th>Média final</th>
        </thead>
        <tbody>
          <tr v-for="(disciplina, index) in disciplinas" :key="index">
            <td>{{ disciplina.nome }}</td>
            <td>{{ disciplina.p1 }}</td>
            <td>{{ disciplina.p2 }}</td>
            <td>{{ disciplina.med }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script>
import { getAllNotas } from '@/api/notas'
export default {
  data: () => ({
    notas: []
  }),
  async mounted () {
    const notas = await getAllNotas()
    this.notas = notas
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
