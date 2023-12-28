// Função para extrair apenas as informações de Valores Faturados
export function extractInvoicedAmounts(
  invoicedAmounts: string[],
): Record<string, string[]> {
  const energyData: Record<string, string[]> = {}

  invoicedAmounts.forEach((line) => {
    const [label, ...values] = line.split(/\s{2,}/).filter(Boolean)
    energyData[label] = values
  })

  return energyData
}
