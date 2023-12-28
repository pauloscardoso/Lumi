import express from 'express'
const app = express()
const port = 3000
import { execPdfProcessor } from './extractPdfData/pdfProcessor'

app.get('/', (_req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`app listening at http://localhost:${port}`)
})

execPdfProcessor()
