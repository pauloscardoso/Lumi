// Função para descartar as chaves com arrays vazios
export function filterEmptyData(
  data: Record<string, string[]>,
): Record<string, string[]> {
  const filteredData: Record<string, string[]> = {}

  Object.entries(data).forEach(([key, value]) => {
    if (value.length > 0) {
      filteredData[key] = value
    }
  })

  return filteredData
}
