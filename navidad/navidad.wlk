//https://drive.google.com/file/d/1hos8ruaxpqOj6f5-h_XWbdWp2zCJVat2/view?pli=1
class Arbol{
    const regalos //=#{}
    const tarjetas //=#{}
    const adornos //=[]
    method capacidadDeRegalos()

    method agregarRegalo(unRegalo){
        if(self.hayCapacidad()){
            regalos.add(unRegalo)
        }
        else{
            throw new NoHayEspacioException(message="No hay suficiente espacio para agregar el regalo")
        }
    }
    method hayCapacidad()= regalos.size() < self.capacidadDeRegalos()

    method beneficiarios(){
        return self.destinatarioDeTarjetas().union(self.destinatarioDeRegalos())
        //return regalos.map({unRegalo => unRegalo.beneficiario()}) && tarjetas.map({unaTarjeta => unaTarjeta.beneficiario()})
    }
    method destinatarioDeTarjetas()= tarjetas.map({unaTarjeta => unaTarjeta.beneficiario()})
    method destinatarioDeRegalos()= regalos.map({unRegalo => unRegalo.beneficiario()})

    method costoDeRegalos(){
        return regalos.sum({unRegalo=>unRegalo.precio()})
    }

    method importanciaAdornoNavidenio(){
        return adornos.sum({unAdorno=>unAdorno.importancia()})
    }


    //empezamos a dudar con los siguientes métodos
/*
6. Saber
a. si nos encontramos ante un regalo “teQuierenMucho”, 
esto es cuando el precio del regalo es superior al
umbral del precio de regalo promedio, 
este umbral es el mismo para todos los regalos.
b. si nos encontramos ante un arbol portentoso, 
esto pasa si la cantidad de regalos “teQuierenMucho” es
mas de 5 o hay una tarjeta con $1000 o más.
7. Conocer cual es el adorno mas pesado de todo el árbol
*/
    method esPortentoso(){
        return self.loQuierenMucho() || self.hayTarjetaCara()
    }
    method loQuierenMucho()= regalos.count({unRegalo=>unRegalo.teQuierenMucho()}) > 5
    method hayTarjetaCara()= tarjetas.any({unaTarjeta=>unaTarjeta.esCara()})
    method adornoMasPesado(){
        return adornos.max({unAdorno=>unAdorno.peso()})
    }
}

class NoHayEspacioException inherits Exception{}

class ArbolesNaturales inherits Arbol{
    var vejez
    const tamanioDeTronco

    override method capacidadDeRegalos() = vejez * tamanioDeTronco
}

class ArbolesArtificiales inherits Arbol{
    const cantidadDeVaras

    override method capacidadDeRegalos() = cantidadDeVaras
}

class Regalo {
    const precio
    const destinatario
    const umbral
    method beneficiario()=destinatario
    method precio()=precio
    method teQuierenMucho()= precio>umbral
}
class Tarjeta{
    const destinatario
    const valor
    const precio = 2
    //method precio()=2
    method beneficiario()=destinatario
    method esCara()= valor > 1000
}
class Adorno{
    const peso
    const coeficienteDeSuperioridad
    method importancia() = peso * coeficienteDeSuperioridad
    method peso()=peso
}

class Luz inherits Adorno{
    const cantidadDeLamparitas
    override method importancia() = super() * cantidadDeLamparitas
}
class FiguraElaborada inherits Adorno{
    const volumen
    override method importancia() = super() + volumen
}
class Guirnalda inherits Adorno{ //la heredación por la importancia()
    var aniosEnUso
    //const anioDeCompra
    const pesoBase
    override method peso()= pesoBase - 100 * aniosEnUso
    //override method peso()= pesoBase - 100 * self.aniosDeUso()
    //method aniosDeUso()= self.fechaActual()-anioDeCompra
    //method fechaActual()= new Date().year()
}