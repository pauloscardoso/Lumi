/*
  Warnings:

  - You are about to drop the column `details` on the `Customer` table. All the data in the column will be lost.
  - You are about to drop the `EnergyBill` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "EnergyBill" DROP CONSTRAINT "EnergyBill_customer_id_fkey";

-- AlterTable
ALTER TABLE "Customer" DROP COLUMN "details";

-- DropTable
DROP TABLE "EnergyBill";

-- CreateTable
CREATE TABLE "Invoice" (
    "invoice_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "reference_mounth" TEXT NOT NULL,
    "electrical_energy_kwh" DECIMAL(65,30) NOT NULL,
    "electrical_energy_value" DECIMAL(65,30) NOT NULL,
    "sceee_energy_kwh" DECIMAL(65,30) NOT NULL,
    "sceee_energy_value" DECIMAL(65,30) NOT NULL,
    "compensated_energy_kwh" DECIMAL(65,30) NOT NULL,
    "compensated_energy_value" DECIMAL(65,30) NOT NULL,
    "public_lighting_contribution" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("invoice_id")
);

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;
