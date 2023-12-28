/*
  Warnings:

  - The primary key for the `Customer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Invoice` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[customer_id]` on the table `Customer` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[invoice_id]` on the table `Invoice` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Invoice" DROP CONSTRAINT "Invoice_customer_id_fkey";

-- AlterTable
ALTER TABLE "Customer" DROP CONSTRAINT "Customer_pkey",
ALTER COLUMN "customer_id" DROP DEFAULT,
ALTER COLUMN "customer_id" SET DATA TYPE TEXT;
DROP SEQUENCE "Customer_customer_id_seq";

-- AlterTable
ALTER TABLE "Invoice" DROP CONSTRAINT "Invoice_pkey",
ALTER COLUMN "invoice_id" DROP DEFAULT,
ALTER COLUMN "invoice_id" SET DATA TYPE TEXT,
ALTER COLUMN "customer_id" SET DATA TYPE TEXT;
DROP SEQUENCE "Invoice_invoice_id_seq";

-- CreateIndex
CREATE UNIQUE INDEX "Customer_customer_id_key" ON "Customer"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_invoice_id_key" ON "Invoice"("invoice_id");

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer"("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;
