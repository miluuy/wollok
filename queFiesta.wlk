// https://docs.google.com/document/d/1jhvpQfmiLEq7tlSJfT-b0f-aajmAlW7zfU-vsNVamGI/edit?tab=t.0

object manic {
    var property estrellasEncontradas = 0
    var cantidadDeGlobos = 0

method comprarGlobos(cantidad){
    cantidadDeGlobos+=cantidad
    }

// PUNTO 1
    method encontrarConstelacion(){
        estrellasEncontradas += 8
    } 

    method regalarEstrella(){
        estrellasEncontradas -= 1
    }

// PUNTO 2
    method estaListoParaFiesta(){
        return estrellasEncontradas >=4
    }


    method todoListoParaFiesta(){
        return self.estaListoParaFiesta() && self.tieneMuchosGlobos()
    }
    method tieneMuchosGlobos(){
        return cantidadDeGlobos > 50
    }
}
/*
wollok:queFiesta> manic.encontrarConstelacion()
✓ 
wollok:queFiesta> manic.estrellasEncontradas()
✓ 8

wollok:queFiesta> manic.regalarEstrella()
✓ 
wollok:queFiesta> manic.estrellasEncontradas()
✓ 7

wollok:queFiesta> manic.estrellasEncontradas(0)
✓
wollok:queFiesta> manic.estaListoParaFiesta()
✓
*/
//PUNTO3
/*
object fiesta{
    var organizador = chuy
    method todoListoParaFiesta(){
        return organizador.estaListoParaFiesta() && organizador.tieneMuchosGlobos()
    }
}
*/

//PUNTO 4
// hay que hacer como un wollok de este código en prolog estaListoParaFista(chuy).
object chuy {
    var cantidadDeGlobos = 0
    
    method comprarGlobos(cantidad){
    cantidadDeGlobos+=cantidad
    }
    method estaListoParaFiesta()=true

    method todoListoParaFiesta(){
        return self.estaListoParaFiesta() && self.tieneMuchosGlobos()
    }
    method tieneMuchosGlobos(){
        return cantidadDeGlobos > 50
    }
}

//PUNTO 5
object capy {
    var property cantidadDeLatas = 0
    var cantidadDeGlobos = 0

method comprarGlobos(cantidad){
    cantidadDeGlobos+=cantidad
    }

    method recolectarLatas(){
        cantidadDeLatas += 1
    }
    method reciclarLatas(){
        cantidadDeLatas -= 5
    }
    method estaListoParaFiesta() {return cantidadDeLatas.even()}

    method todoListoParaFiesta(){
        return self.estaListoParaFiesta() && self.tieneMuchosGlobos()
    }
    method tieneMuchosGlobos(){
        return cantidadDeGlobos > 50
    }
}

//PUNTO 6

/*
//por cada animalito:
var cantidadDeGlobos = 0

method comprarGlobos(cantidad){
    cantidadDeGlobos+=cantidad
    }
//y que verifique si el organizador tiene cantidad suficiente de globos
*/