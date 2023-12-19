/*
  Warnings:

  - You are about to drop the column `productId` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `subcategory` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `category` DROP FOREIGN KEY `Category_productId_fkey`;

-- DropForeignKey
ALTER TABLE `subcategory` DROP FOREIGN KEY `Subcategory_productId_fkey`;

-- AlterTable
ALTER TABLE `category` DROP COLUMN `productId`;

-- AlterTable
ALTER TABLE `product` ADD COLUMN `categoryId` VARCHAR(191) NULL,
    ADD COLUMN `subcategoryId` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `subcategory` DROP COLUMN `productId`;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_subcategoryId_fkey` FOREIGN KEY (`subcategoryId`) REFERENCES `Subcategory`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
