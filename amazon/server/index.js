import express from "express";
import mongoose from "mongoose";
import { authRouter } from "./routes/auth.js";

const app = express();

const PORT = 1995;
const DB_CONNECT = "mongodb+srv://duongxuannam1995:Kuteshock95@cluster0.v01xu.mongodb.net/?retryWrites=true&w=majority"

app.get('/hello',(req,res) => {
    return res.send('hi')
})

app.use(express.json())
app.use(authRouter)

mongoose.connect(DB_CONNECT).then(() => {
    console.log('connect mongo success')
}).catch(e => {
    console.log('connect mongo error',e)
})

app.listen(PORT,"0.0.0.0",() => {
    console.log(`server run on ${PORT}`)
})