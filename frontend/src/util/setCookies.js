const cookieName = 'eazyNotasData'

export const saveOnLocalStorage = (data) => {
  const stringfiedObj = JSON.stringify(data)
  localStorage.setItem(cookieName, stringfiedObj)
}

export const getOnLocalStorage = () => {
  const stringfiedObj = localStorage.getItem(cookieName)
  const convertedObj = JSON.parse(stringfiedObj)
  return convertedObj
}

export const removeLocalStorage = () => {
  localStorage.removeItem(cookieName)
}
