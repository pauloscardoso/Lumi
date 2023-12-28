/*
  Warnings:

  - You are about to drop the column `custumer_id` on the `EnergyBill` table. All the data in the column will be lost.
  - You are about to drop the column `eletrical_energy_kwh` on the `EnergyBill` table. All the data in the column will be lost.
  - You are about to drop the column `eletrical_energy_value` on the `EnergyBill` table. All the data in the column will be lost.
  - You are about to drop the `Custumer` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `customer_id` to the `EnergyBill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `electrical_energy_kwh` to the `EnergyBill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `electrical_energy_value` to the `EnergyBill` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EnergyBill" DROP CONSTRAINT "EnergyBill_custumer_id_fkey";

-- AlterTable
ALTER TABLE "EnergyBill" DROP COLUMN "custumer_id",
DROP COLUMN "eletrical_energy_kwh",
DROP COLUMN "eletrical_energy_value",
ADD COLUMN     "customer_id" INTEGER NOT NULL,
ADD COLUMN     "electrical_energy_kwh" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "electrical_energy_value" DECIMAL(65,30) NOT NULL;

-- DropTable
DROP TABLE "Custumer";

-- CreateTable
CREATE TABLE "Customer" (
    "customer_id" SERIAL NOT NULL,
    "customer" INTEGER NOT NULL,
    "installation" INTEGER NOT NULL,
    "details" VARCHAR(255) NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("customer_id")
);

-- AddForeignKey
ALTER TABLE "EnergyBill" ADD CONSTRAINT "EnergyBill_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;
