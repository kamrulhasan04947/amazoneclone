const express = require("express");
const User = require('../models/user_model');
const hasher = require('bcryptjs');

const authRouter = express.Router();

// authRouter.get('/user', (req, res)=>{
//     res.json({msg: "hasan"});
// });


authRouter.post('/admin/signup', async (req, res)=>{
   try{
        const {name, email, password} = req.body;
        const existingUser = await User.findOne({email});

        if(existingUser){
            return res.status(400).json({msg: "User alrady exists"});
        }

        const hashedPassord = await hasher.hash(password, 8);

        let user = new User(
            {
                name,
                email,
                password: hashedPassord
            }
        );

        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({error: e.message});
    }
});


//exporting file to access

module.exports = authRouter;