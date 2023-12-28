import { PrismaClient } from '@prisma/client'

interface Invoice {
  referenceMonth: string
  electricalEnergyKWH: number
  electricalEnergyValue: number
  sceeeEnergyKWH: number
  sceeeEnergyValue: number
  compensatedEnergyKWH: number
  compensatedEnergyValue: number
  publicLightingContribution: number
}

interface Customer {
  customerNumber: number
  installationNumber: number
}

// Função para converter uma string de números separados por ponto em um número único
function convertToNumber(str: string): number {
  return Number(str?.replace(/\./g, '').replace(',', '.'))
}

export function finallyData(filteredBilledAmounts: Record<string, string[]>) {
  const customers: Customer[] = []
  const invoices: Invoice[] = []

  let invoiceData: any = {}

  const referenciaIndex = Object.keys(filteredBilledAmounts).indexOf('Referente a')
  if (referenciaIndex !== -1 && Object.keys(filteredBilledAmounts).length > referenciaIndex + 1) {
    const nextKey = Object.keys(filteredBilledAmounts)[referenciaIndex + 1]
    invoiceData = {
      referenceMonth: nextKey,
    }
  }

  const electricalEnergyKWH = convertToNumber(filteredBilledAmounts['Energia ElétricakWh'][0])
  const electricalEnergyValue = parseFloat(filteredBilledAmounts['Energia ElétricakWh'][2].split(' ')[0].replace(',', '.'))
  const sceeeEnergyKWH = convertToNumber(filteredBilledAmounts['Energia SCEE s/ ICMSkWh'][0])
  const sceeeEnergyValue = parseFloat(filteredBilledAmounts['Energia SCEE s/ ICMSkWh'][2].split(' ')[0].replace(',', '.'))
  const compensatedEnergyKWH = convertToNumber(filteredBilledAmounts['Energia compensada GD IkWh'][0])
  const compensatedEnergyValue = parseFloat(filteredBilledAmounts['Energia compensada GD IkWh'][2].split(' ')[0].replace(',', '.'))
  const publicLightingContribution = convertToNumber(filteredBilledAmounts['Contrib Ilum Publica Municipal'][0])

  const invoiceValues = {
    electricalEnergyKWH,
    electricalEnergyValue,
    sceeeEnergyKWH,
    sceeeEnergyValue,
    compensatedEnergyKWH,
    compensatedEnergyValue,
    publicLightingContribution,
    ...invoiceData,
  }

  invoices.push(invoiceValues)

  Object.entries(filteredBilledAmounts).forEach(([key, value]) => {
    if (Array.isArray(value) && key.startsWith('7')) {
      const customerNumber = convertToNumber(key)
      const installationNumber = convertToNumber(value.pop()!)

      customers.push({
        customerNumber,
        installationNumber,
      })
    }
  })

  const result = { customers, invoices }
  return result
}
