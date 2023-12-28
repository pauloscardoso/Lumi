export function parseExtractedData(data: any) {
  const sections = data?.text.split('\n\n')
  const relevantData = {} as any

  sections?.forEach((section: any) => {
    const lines = section.split('\n')
    const sectionName = lines[0]

    // Adicionar as linhas restantes como dados dessa seção
    relevantData[sectionName] = lines.slice(1)
  })

  return relevantData
}
