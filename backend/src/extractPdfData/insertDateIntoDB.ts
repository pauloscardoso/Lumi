import { PrismaClient } from '@prisma/client'
import { v4 as uuidv4 } from 'uuid'
import { finallyData } from './structuredData'

const prisma = new PrismaClient()

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

export async function insertDateIntoDB(data: { customers: Customer[]; invoices: Invoice[] }): Promise<void> {
  const { customers, invoices } = data

  try {
    //descomentar o código abaixo para inserir os dados no banco de dados

    // for (const customer of customers) {
    //   const customerId = uuidv4()
    //   await prisma.customer.create({
    //     data: {
    //       customer: customer.customerNumber,
    //       installation: customer.installationNumber,
    //       customer_id: customerId,
    //     },
    //   })

    //   for (const invoice of invoices) {
    //     await prisma.invoice.create({
    //       data: {
    //         reference_mounth: invoice.referenceMonth,
    //         electrical_energy_kwh: invoice.electricalEnergyKWH,
    //         electrical_energy_value: invoice.electricalEnergyValue,
    //         sceee_energy_kwh: invoice.sceeeEnergyKWH,
    //         sceee_energy_value: invoice.sceeeEnergyValue,
    //         compensated_energy_kwh: invoice.compensatedEnergyKWH,
    //         compensated_energy_value: invoice.compensatedEnergyValue,
    //         public_lighting_contribution: invoice.publicLightingContribution,
    //         customer_id: customerId,
    //       },
    //     })
    //   }
    // }

    // console.log('Dados inseridos com sucesso!')
  } catch (error) {
    console.error('Erro ao inserir dados:', error)
    throw error
  } finally {
    await prisma.$disconnect()
  }
}
