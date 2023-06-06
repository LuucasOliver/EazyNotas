import api from '@/config/api'

export const createTurma = async (sala, idProfessor) => {
  const { data } = await api.post('turmas', {
    sala,
    idProfessor
  })
  return data
}

export const getAllTurma = async () => {
  const { data } = await api.get('turmas')
  return data
}

export const getTurma = async (turma) => {
  const { data } = await api.get(`turma/${turma}`)
  return data
}
