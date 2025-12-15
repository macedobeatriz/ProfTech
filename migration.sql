-- CreateEnum
CREATE TYPE "TipoQuestao" AS ENUM ('MULTIPLA_ESCOLHA', 'DISSERTATIVA', 'VERDADEIRO_FALSO');

-- CreateTable
CREATE TABLE "Usuario" (
    "id_user" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "Assunto" (
    "id_assunto" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "Assunto_pkey" PRIMARY KEY ("id_assunto")
);

-- CreateTable
CREATE TABLE "Questao" (
    "id_questao" SERIAL NOT NULL,
    "enunciado" TEXT NOT NULL,
    "tipo" "TipoQuestao" NOT NULL,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_assunto" INTEGER NOT NULL,
    "id_user" INTEGER NOT NULL,

    CONSTRAINT "Questao_pkey" PRIMARY KEY ("id_questao")
);

-- CreateTable
CREATE TABLE "Prova" (
    "id_prova" SERIAL NOT NULL,
    "titulo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_user" INTEGER NOT NULL,

    CONSTRAINT "Prova_pkey" PRIMARY KEY ("id_prova")
);

-- CreateTable
CREATE TABLE "ProvaQuestao" (
    "id" SERIAL NOT NULL,
    "id_prova" INTEGER NOT NULL,
    "id_questao" INTEGER NOT NULL,
    "data_inclusao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProvaQuestao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ProvaQuestao_id_prova_id_questao_key" ON "ProvaQuestao"("id_prova", "id_questao");

-- AddForeignKey
ALTER TABLE "Questao" ADD CONSTRAINT "Questao_id_assunto_fkey" FOREIGN KEY ("id_assunto") REFERENCES "Assunto"("id_assunto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Questao" ADD CONSTRAINT "Questao_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prova" ADD CONSTRAINT "Prova_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProvaQuestao" ADD CONSTRAINT "ProvaQuestao_id_prova_fkey" FOREIGN KEY ("id_prova") REFERENCES "Prova"("id_prova") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProvaQuestao" ADD CONSTRAINT "ProvaQuestao_id_questao_fkey" FOREIGN KEY ("id_questao") REFERENCES "Questao"("id_questao") ON DELETE RESTRICT ON UPDATE CASCADE;
