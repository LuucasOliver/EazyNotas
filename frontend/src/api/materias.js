import api from '@/config/api'

export const createMaterias = async (
  nomeMat,
  idProfessor,
  diaMateria,
  horarioAula
) => {
  const { data } = await api.post('materias', {
    nomeMat, idProfessor, diaMateria, horarioAula
  })
  return data
}

export const getAllMaterias = async () => {
  const { data } = await api.get('materias')
  return data
}

export const getMaterias = async (idMateria) => {
  const { data } = await api.get(`materias/${idMateria}`)
  return data
}
