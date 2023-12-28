import { extractDataFromPDF } from './extractDataFromPDF'
import { extractInvoicedAmounts } from './extractInvoicedAmounts'
import { filterEmptyData } from './filterEmptyData'
import { parseExtractedData } from './parseExtractedData'
import { insertDateIntoDB } from './insertDateIntoDB'
import { finallyData } from './structuredData'

export async function processMultiplePDFs(pdfPaths: String[]) {
  try {
    for (const pdfPath of pdfPaths) {
      const extractedData = await extractDataFromPDF(pdfPath)
      const organizedData = parseExtractedData(extractedData)
      const invoicedAmounts = extractInvoicedAmounts(organizedData['Valores Faturados'])
      const filteredBilledAmounts = filterEmptyData(invoicedAmounts)
      const result = finallyData(filteredBilledAmounts)

      insertDateIntoDB(result)
    }
  } catch (error) {
    console.error('Erro ao processar PDFs:', error)
    throw error
  }
}
