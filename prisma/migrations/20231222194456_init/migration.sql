-- CreateTable
CREATE TABLE "Client" (
    "client_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "details" VARCHAR(255) NOT NULL,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("client_id")
);

-- CreateTable
CREATE TABLE "EnergyBill" (
    "invoice_id" SERIAL NOT NULL,
    "client_id" INTEGER NOT NULL,
    "reference_mounth" TEXT NOT NULL,
    "eletrical_energy_kwh" DECIMAL(65,30) NOT NULL,
    "eletrical_energy_value" DECIMAL(65,30) NOT NULL,
    "sceee_energy_kwh" DECIMAL(65,30) NOT NULL,
    "sceee_energy_value" DECIMAL(65,30) NOT NULL,
    "compensated_energy_kwh" DECIMAL(65,30) NOT NULL,
    "compensated_energy_value" DECIMAL(65,30) NOT NULL,
    "public_lighting_contribution" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "EnergyBill_pkey" PRIMARY KEY ("invoice_id")
);

-- AddForeignKey
ALTER TABLE "EnergyBill" ADD CONSTRAINT "EnergyBill_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Client"("client_id") ON DELETE RESTRICT ON UPDATE CASCADE;
