import { defineStore } from 'pinia'

export const authStore = defineStore({
  id: 'auth-store',
  state: () => {
    return {
      isLogged: false,
      auth: {}
    }
  },
  actions: {
    async login(payload: object): Promise<object> {
      if (this.isLogged) {
        return {};
      }

      const { data, error } = await fetchApi('POST', '/api/auth/login', payload)
        .catch((error) => error.data)

      this.auth = data.value

      this.isLogged = true

      return data.value
    },
    logout(payload: object): any {
      this.isLogged = false
    },
  },
})