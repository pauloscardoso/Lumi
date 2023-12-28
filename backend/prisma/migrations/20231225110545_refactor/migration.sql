/*
  Warnings:

  - You are about to drop the column `client_id` on the `EnergyBill` table. All the data in the column will be lost.
  - You are about to drop the `Client` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `custumer_id` to the `EnergyBill` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EnergyBill" DROP CONSTRAINT "EnergyBill_client_id_fkey";

-- AlterTable
ALTER TABLE "EnergyBill" DROP COLUMN "client_id",
ADD COLUMN     "custumer_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Client";

-- CreateTable
CREATE TABLE "Custumer" (
    "custumer_id" SERIAL NOT NULL,
    "custumer" INTEGER NOT NULL,
    "installation" INTEGER NOT NULL,
    "details" VARCHAR(255) NOT NULL,

    CONSTRAINT "Custumer_pkey" PRIMARY KEY ("custumer_id")
);

-- AddForeignKey
ALTER TABLE "EnergyBill" ADD CONSTRAINT "EnergyBill_custumer_id_fkey" FOREIGN KEY ("custumer_id") REFERENCES "Custumer"("custumer_id") ON DELETE RESTRICT ON UPDATE CASCADE;
