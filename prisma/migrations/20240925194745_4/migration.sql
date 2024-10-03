-- create postgis extension
CREATE EXTENSION postgis;

-- CreateTable
CREATE TABLE "MapFeature" (
    "id" SERIAL NOT NULL,
    "mapLayerId" INTEGER,
    "geometry" geometry NOT NULL,

    CONSTRAINT "MapFeature_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MapFeature" ADD CONSTRAINT "MapFeature_mapLayerId_fkey" FOREIGN KEY ("mapLayerId") REFERENCES "MapLayer"("id") ON DELETE SET NULL ON UPDATE CASCADE;
