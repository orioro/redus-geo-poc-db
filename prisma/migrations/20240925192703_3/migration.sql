-- DropForeignKey
ALTER TABLE "MapLayer" DROP CONSTRAINT "MapLayer_parentMapLayerId_fkey";

-- AlterTable
ALTER TABLE "MapLayer" ALTER COLUMN "parentMapLayerId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "MapLayer" ADD CONSTRAINT "MapLayer_parentMapLayerId_fkey" FOREIGN KEY ("parentMapLayerId") REFERENCES "MapLayer"("id") ON DELETE SET NULL ON UPDATE CASCADE;
