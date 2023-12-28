/*
  Warnings:

  - The `invoice_id` column on the `Invoice` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- DropIndex
DROP INDEX "Invoice_invoice_id_key";

-- AlterTable
ALTER TABLE "Invoice" DROP COLUMN "invoice_id",
ADD COLUMN     "invoice_id" SERIAL NOT NULL,
ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY ("invoice_id");
