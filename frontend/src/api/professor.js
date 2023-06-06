import api from '@/config/api'

export const createProfessor = async (nome, senha) => {
  const { data } = await api.post('professor', {
    nome,
    senha
  })
  return data
}

export const getAllProfessor = async () => {
  const { data } = await api.get('professor')
  return data
}
