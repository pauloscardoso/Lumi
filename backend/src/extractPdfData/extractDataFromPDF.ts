import pdf from 'pdf-parse'
import fs from 'fs/promises'
import { parseExtractedData } from './parseExtractedData'

// Função para extrair dados de um PDF
export async function extractDataFromPDF(pdfPath: any) {
  try {
    const dataBuffer = await fs.readFile(pdfPath)
    const data = await pdf(dataBuffer)
    parseExtractedData(data)
    return data
  } catch (error) {
    console.error('Erro ao ler o PDF:', error)
    throw error
  }
}
