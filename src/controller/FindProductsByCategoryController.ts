import { Request, Response } from "express"
import { prisma } from "../database/prisma"

export const findProductbyCategoory = async (req: Request, res: Response) => {
    const {search} = req.query

    const result = await prisma.product.findMany({
        where:{
            category:{
                contains: String(search).toLowerCase()
            }
        }
    })

    if(!search) {
        return res.status(404).json({message: "Product not found"})
      }

    return res.json(result)
}
