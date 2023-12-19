/*
  Warnings:

  - You are about to drop the column `categoryId` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `subcategoryId` on the `product` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Category` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Subcategory` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_subcategoryId_fkey`;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `categoryId`,
    DROP COLUMN `subcategoryId`,
    ADD COLUMN `category` VARCHAR(191) NULL,
    ADD COLUMN `subcategory` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Category_name_key` ON `Category`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `Subcategory_name_key` ON `Subcategory`(`name`);

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_category_fkey` FOREIGN KEY (`category`) REFERENCES `Category`(`name`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_subcategory_fkey` FOREIGN KEY (`subcategory`) REFERENCES `Subcategory`(`name`) ON DELETE SET NULL ON UPDATE CASCADE;
