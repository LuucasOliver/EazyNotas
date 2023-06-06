import api from '@/config/api'

export const logIn = async (login, senha) => {
  const { data } = await api.post('login', {
    login,
    senha
  })
  return data
}
