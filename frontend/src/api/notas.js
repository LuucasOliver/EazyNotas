import api from '@/config/api'

export const createNota = async (
  rA,
  idMateria,
  notaP1,
  notaP2,
  notaRC
) => {
  const { data } = await api.post('notas', {
    rA,
    idMateria,
    notaP1,
    notaP2,
    notaRC
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
