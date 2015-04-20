


module.exports = function (app,sql) {


app.get('/', function(req, res) { 
	res.render('sesion');
});

app.post('/iniciarsesion', function(req, res) { 
	
	sql.query("SELECT usuario.idrol"
	 +" FROM usuario"
	 +" INNER JOIN sesion "
	 +" ON usuario.idtag=sesion.idtag "
	 +" WHERE usuario=? AND contrasena=?",[req.body.user,req.body.password],function(err,resultado){
	 	if(err){
	 		res.send("No se realizo el query");
	 				
	 	}
	 
	 	else{
	 		try {
	 		switch(resultado[0].idrol){
	 		case 2 : res.send("maestro");
	 		break; 
	 		case 1: res.send("Admin");
	 		break; 
	 	}//fin de swtich 
	 			}
	 			catch (err){
	 				res.send("Usuario o contraseña incorrectos ");
	 			} 
	 	
	 	}//fin de else 
	});
	
});

}

