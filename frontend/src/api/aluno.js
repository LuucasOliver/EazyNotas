import api from '@/config/api'

export const createAluno = async (nome, turma, senhaAluno) => {
  const { data } = await api.post('aluno', {
    nome,
    turma,
    senhaAluno
  })

  return data
}

export const getAllAlunos = async () => {
  const { data } = await api.get('aluno')
  return data
}
