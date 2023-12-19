import express from 'express'
import { router } from './router'
import path from "path"

const app = express()

app.use(express.json())

app.use(router)

app.use("/images", express.static(path.join(__dirname, "..", "uploads")))

const PORT = process.env.PORT || 3434;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});