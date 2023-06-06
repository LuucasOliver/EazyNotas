import api from '@/config/api'

export const createNota = async (
  ra,
  idMateria,
  notaP1,
  notap2,
  notaRc
) => {
  const { data } = await api.post('notas', {
    ra,
    idMateria,
    notaP1,
    notap2,
    notaRc
  })
  return data
}

export const getAllNotas = async () => {
  const { data } = await api.get('notas')
  return data
}

export const getNotasByRa = async (ra) => {
  const { data } = await api.get(`notas/${ra}`)
  return data
}
