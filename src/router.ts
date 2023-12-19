import { Router } from "express";
import { createSubCategory } from "./controller/SubCategoryController";
import { createCategory } from "./controller/CategoryController";
import { createProduct, deleteProduct, getAllProducts, updateProduct } from "./controller/ProductController";
import { createSale } from "./controller/SaleController";
import { findProductbyCategoory } from "./controller/FindProductsByCategoryController";
import { findProduct } from "./controller/FindProductsController";
import { addToWishList, removeFromWishList } from "./controller/WishListController";
import { deleteRateProduct, getAllRates, rateProduct } from "./controller/RatingController";
import uploadsConfig from './config/multer'
import multer from "multer"

export const router = Router()
const upload = multer(uploadsConfig)

// Rotas de Categorias

router.post("/category", createCategory)
router.post("/subcategory", createSubCategory)

// Rotas de Produtos

router.post("/", upload.array("images"), createProduct)
router.get("/allproducts", getAllProducts)
router.put("/updateproduct/:productId/:category/:subcategory", updateProduct)
router.delete("/deleteproduct/:productId", deleteProduct)

// Rotas de Vendas

router.post("/createsale", createSale)

// Rota de Busca

router.get("/filter", findProductbyCategoory)
router.get("/filter", findProduct)

// Rota Lista de Desejos

router.post("/wishlist", addToWishList)
router.delete("/deletewish/:productid/:userId", removeFromWishList)

// Rota de Classificação

router.post("/rating/:userId", rateProduct)
router.delete("/rating/:id", deleteRateProduct)
router.get("/allrates", getAllRates)
