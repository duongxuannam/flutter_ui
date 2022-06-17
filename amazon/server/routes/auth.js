import express from 'express';
import { User } from '../models/user.js';

const authRouter = express.Router();

authRouter.get('/user', (req, res) => {
    res.json({
        msg: "Hello"
    })
})

authRouter.post('/api/signup', async (req, res) => {
 try {
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({email})
    if(existingUser){
        return res.status(400).json({
            msg: "Email already exist"
        })
    }
    const newUser = new User({
        email,
        password,
        name
    })
    const user = await newUser.save()
    return res.status(200).json({
        user
    })
 } catch (error) {
    return res.status(500).json({
        msg: error.toString()
    })
 }
})

export { authRouter };