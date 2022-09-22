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
            const salt = bcrypt.genSaltSync(10);
            const hashedPass = bcrypt.hash(req.body.password, salt);
            if (user==null) {
                const user = User({
                    email: req.body.email,
                    password: hashedPass,
                });
                user.save()
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
               res.json({ message: 'email is not available.'}); 
            }
        }
    });
});

router.post('/signin', (req, res) => {
    User.findOne({ email:req.body.email, password: req.body.password}, (err, user) => {
        if(err) {
            console.log(err);
            res.json(err);
        } else {
            res.status(user);
        }
    })
});

module.exports = router;