import api from '@/config/api'

export const createAluno = async (nome, turma, senha) => {
  const { data } = await api.post('aluno', {
    nome,
    turma,
    senha
  })

  return data
}
