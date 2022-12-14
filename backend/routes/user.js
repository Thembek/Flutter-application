const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../models/User');
const router = express.Router();


router.post('/signup', (req, res) => {
    User.findOne({ email: req.body.email}, (err, user) => {
        if (err) {
            console.log(err);
            res.json(err);
        } else {
            if (user==null) {
                const password = req.body.password;

                bcrypt
                .hash(password, 10)
                .then(hashedPass => {
                    const user = User({
                        email: req.body.email,
                        password: hashedPass,
                    });
                    return user.save()
                })
                .then((err) => {
                    if(err) {
                        console.log(err);
                        res.json(err);
                    } else {
                        console.log(user);
                        res.json(user);
                    }
                });
            } else {
               res.status(404).json({ message: 'this email address already exists.'}); 
            }
        }
    });
});

router.post('/signin', (req, res) => {
   User.findOne({ email: req.body.email})
    .then((user) => {
        if(!user){
            console.log('Invalid user credential.');
            return res.status(500).json({ msg: "Invalid user credential."});
        };
        bcrypt.compare(req.body.password, user.password, (error, isMatch) => {
            if (error) throw error;
            if (isMatch) {
                return res.status(200).json('Welcome back,' + user.email);
            } else {
                console.log('Invalid user credential.');
                return res.status(500).json({ msg: "Invalid user credentials." });
            }
        });
    })
    .catch((error) => console.log(error));
});

module.exports = router;