const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../models/User');
const e = require('express');
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
               res.json({ message: 'email is not available.'}); 
            }
        }
    });
});

router.post('/login', (req, res) => {
    User.findOne({ email: req.body.email, password: req.body.password}, (err, user) => {
        if (err) {
            console.log(err);
            res.status(500).json(err);
        } else {
            res.status(200).json(user);
        }
    });
});

module.exports = router;