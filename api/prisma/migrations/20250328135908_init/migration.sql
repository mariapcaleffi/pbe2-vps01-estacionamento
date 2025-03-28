-- CreateTable
CREATE TABLE `Automovel` (
    `placa` VARCHAR(7) NOT NULL,
    `proprietario` VARCHAR(50) NOT NULL,
    `tipo` VARCHAR(50) NOT NULL,
    `modelo` VARCHAR(50) NOT NULL,
    `marca` VARCHAR(50) NOT NULL,
    `cor` VARCHAR(50) NOT NULL,
    `ano` INTEGER NULL,
    `telefone` VARCHAR(15) NOT NULL,

    PRIMARY KEY (`placa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estadia` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `entrada` TIMESTAMP(6) NOT NULL,
    `saida` TIMESTAMP(6) NULL,
    `valorHora` DOUBLE NOT NULL,
    `valorTotal` DOUBLE NULL,
    `calcValorTotal` DOUBLE NOT NULL,
    `automovelId` VARCHAR(7) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Estadia` ADD CONSTRAINT `Estadia_automovelId_fkey` FOREIGN KEY (`automovelId`) REFERENCES `Automovel`(`placa`) ON DELETE RESTRICT ON UPDATE CASCADE;
