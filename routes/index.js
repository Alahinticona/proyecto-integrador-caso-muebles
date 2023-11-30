var express = require('express');
var router = express.Router();
var dbConn  = require('../lib/db');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

// ruta para home
router.get('/productos', function(req, res, next) {
  res.render('productos');
});

// ruta para oferta
router.get('/oferta', function(req, res, next) {
  res.render('oferta');
});

// ruta para oferta
router.get('/contactanos', function(req, res, next) {
  res.render('contactanos');
});

/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login');
});

router.get('/register', function(req, res, next) {
  res.render('register');
});

//----------------------------------//
router.get('/gerente', function(req, res, next) {
  if (req.session.nivel === "1") {
    res.render('gerente');
  } else {
    res.redirect("/login");
  }
});

router.get('/empleado', function(req, res, next) {
 if (req.session.nivel === "2") {
   res.render('empleado');
 } else {
   res.redirect("/login");
 }
});

router.get('/comprador', function(req, res, next) {
 if (req.session.nivel === "3") {
   res.render('comprador');
 } else {
   res.redirect("/login");
 }
});


//login
router.post('/login', function(req, res, next) {
  const email = req.body.email;
  const password = req.body.password;

  dbConn.query("SELECT * FROM usuarios WHERE email = ? AND password = ?", [email, password], function(err, rows) {
    if (err) {
      console.log(err);
    } else {
      console.log(rows);
      if (rows.length) {
        req.session.id = rows[0].id;
        req.session.email = rows[0].email;
        req.session.password = rows[0].password;
        req.session.nivel = rows[0].nivel;

        switch (rows[0].nivel) {
          case "1":
            res.redirect("/gerente");
            break;
          case "2":
            res.redirect("/empleado");
            break;
          case "3":
            res.redirect("/comprador");
            break;
          default:
            res.redirect("/");
        }
      } else {
        res.redirect("/");
      }
    }
  });
});

//buscar 
router.post('/search', function(req, res, next) {
  let name = req.body.search;
  
  dbConn.query("SELECT * FROM categorias WHERE cat_id LIKE ?", ['%' + name + '%'], function(err, rows) {
    if(err) {
        req.flash('error', err);
        res.render('productos', { data: '' });   
    } else {
        res.render('productos', { data: rows });
    }
  });
});


router.get('/productos', function (req, res, next) {
  dbConn.query('SELECT * FROM productos ORDER BY id desc', function (err, rows) {
      if (err) {
          req.flash('error', err);
          res.render('productos', { data: '' });
      } else {
          res.render('productos', { data: rows });
      }
  });
});

router.get('/logout',function(req,res){
  req.session.destroy();
  res.redirect("/");
});

module.exports = router;
