const mongoose = require('mongoose');

const userSchema = mongoose.Schema(
    {
        name:{
            required:true,
            type:String,
            trim:true,
        },

        email:{
            required:true,
            type:String,
            trim: true,
            validate:{
                validator: (value)=>{
                    const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                    return value.match(re);
                },
                message:"Plaese enter a valid email address",
            }
        },

        password:{
            required: true,
            type: String,
            validate:{
                validator: (value)=>{
                    return value.length > 6;
                },
                message:"Password Must contain 6 cheracter",
            }
            
        },

        address:{
            type:String,
            default: '',
        },

        usertype: {
            type: String,
            default: 'user',
        },

    }
);

// Create User model by UserSchema

const User = mongoose.model("User", userSchema);


module.exports = User;