/*
  Warnings:

  - The primary key for the `automovel` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `automovelId` on the `estadia` table. All the data in the column will be lost.
  - Added the required column `automovelPlaca` to the `Estadia` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `estadia` DROP FOREIGN KEY `Estadia_automovelId_fkey`;

-- DropIndex
DROP INDEX `Estadia_automovelId_fkey` ON `estadia`;

-- AlterTable
ALTER TABLE `automovel` DROP PRIMARY KEY,
    MODIFY `placa` VARCHAR(191) NOT NULL,
    MODIFY `proprietario` VARCHAR(191) NOT NULL,
    MODIFY `tipo` VARCHAR(191) NOT NULL,
    MODIFY `modelo` VARCHAR(191) NOT NULL,
    MODIFY `marca` VARCHAR(191) NOT NULL,
    MODIFY `cor` VARCHAR(191) NULL,
    MODIFY `telefone` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`placa`);

-- AlterTable
ALTER TABLE `estadia` DROP COLUMN `automovelId`,
    ADD COLUMN `automovelPlaca` VARCHAR(191) NOT NULL,
    MODIFY `entrada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `saida` DATETIME(3) NULL;

-- AddForeignKey
ALTER TABLE `Estadia` ADD CONSTRAINT `Estadia_automovelPlaca_fkey` FOREIGN KEY (`automovelPlaca`) REFERENCES `Automovel`(`placa`) ON DELETE RESTRICT ON UPDATE CASCADE;
