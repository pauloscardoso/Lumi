import { processMultiplePDFs } from './processMultiplePDFs'

export function execPdfProcessor() {
  processMultiplePDFs(pdfPaths)
    .then(() => {
      console.log('Processamento de PDFs concluído!')
    })
    .catch((error: any) => {
      console.error('Erro ao processar PDFs:', error)
    })
}

const pdfPaths = [
  'src/invoices/1.pdf',
  'src/invoices/2.pdf',
  'src/invoices/3.pdf',
  'src/invoices/4.pdf',
  'src/invoices/5.pdf',
  'src/invoices/6.pdf',
  'src/invoices/7.pdf',
  'src/invoices/8.pdf',
  'src/invoices/9.pdf',
  'src/invoices/10.pdf',
  'src/invoices/11.pdf',
  'src/invoices/12.pdf',
  'src/invoices/13.pdf',
  'src/invoices/14.pdf',
  'src/invoices/15.pdf',
  'src/invoices/16.pdf',
  'src/invoices/17.pdf',
  'src/invoices/18.pdf',
]
