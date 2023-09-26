export const fetchApi = (method:string = "GET", path: string, payload:object = {}, opts: object = {}) => {
    const config = useRuntimeConfig()
    
    return useFetch(path, {
        baseURL: config.public.baseURL,
        method: method,
        body: payload,
        ...opts
    })
}