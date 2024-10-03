-- CreateTable
CREATE TABLE "MapLayer" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255),
    "description" TEXT,
    "featurePropertySchema" JSONB,
    "parentMapLayerId" INTEGER NOT NULL,

    CONSTRAINT "MapLayer_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MapLayer" ADD CONSTRAINT "MapLayer_parentMapLayerId_fkey" FOREIGN KEY ("parentMapLayerId") REFERENCES "MapLayer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
