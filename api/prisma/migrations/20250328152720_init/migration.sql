/*
  Warnings:

  - You are about to drop the column `calcValorTotal` on the `estadia` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `estadia` DROP COLUMN `calcValorTotal`,
    ALTER COLUMN `entrada` DROP DEFAULT;
