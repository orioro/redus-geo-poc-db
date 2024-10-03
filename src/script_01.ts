import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const layer = await prisma.mapLayer.create({
    data: {
      name: 'Teste com feature',
      description: 'Testes descrição',
      parentMapLayer: {
        create: {
          name: 'Parent do Teste',
        },
      },
    },
  })

  console.log('layer', layer)

  const features = await prisma.mapFeature.create({
    data: {
      mapLayerId: layer.id
      // geometry: 'POINT(0,0)'
    }
  })

  console.log('features', features)
  
  // await prisma.mapLayer.create({
  //   data: {
  //     name: 'Teste',
  //     description: 'Testes descrição',
  //     parentMapLayer: {
  //       create: {
  //         name: 'Parent do Teste',
  //       },
  //     },
  //   },
  // })
  

  // const allLayers = await prisma.mapLayer.findMany({
  //   include: {
  //     parentMapLayer: true,
  //     childMapLayers: true
  //   }
  // })
  // console.log(allLayers)

  // await prisma.user.create({
  //   data: {
  //     name: 'Alice',
  //     email: 'alice@prisma.io',
  //     posts: {
  //       create: { title: 'Hello World' },
  //     },
  //     profile: {
  //       create: { bio: 'I like turtles' },
  //     },
  //   },
  // })

  // const allUsers = await prisma.user.findMany({
  //   include: {
  //     posts: true,
  //     profile: true,
  //   },
  // })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
