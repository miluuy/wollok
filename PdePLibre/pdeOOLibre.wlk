//https://docs.google.com/document/d/12-nwknWda3HGG6r4vw-tDM_wmUnPUr0b4_i9WUJ8vhg/edit?pli=1&tab=t.0#heading=h.hayhufx5p0at
/*
// productos
atributos nombre y precio base
precio es precio base + iva
hay tres productos que el precio final tiene un agregado 
(+ 1000 muebles, o + 10% indumentaria (si esTemporadaActual), o =0 gangas)
*/

class Producto{
    const nombre
    var precioBase

    method precio()= precioBase + self.iva()
    method precioFinal()
    method iva()= 21* precioBase /100
    method nombreEnOferta()= "SUPER OFERTA " + nombre
}

class Mueble inherits Producto{
    override method precioFinal(){
        return self.precio() + 1000
    }
}
class Indumentaria inherits Producto{
    var esTemporadaActual
    override method precioFinal(){
        if(esTemporadaActual){
            return self.precio() + 10*precioBase/100
        }
        else{
            return self.precio()
        }
    }
}
class Ganga inherits Producto{
    override method precioFinal(){
        return 0
    }
    override method nombreEnOferta()= super() + "COMPRAME PRO FAVOR"
}
/*
// cupones
atributos:
uso único-> var fueUsado, inicialmente false
porcentaje de descuento
*/
class Cupon{
    var fueUsado = false
    var descuento

    method aplicarCupon(unPrecio){
            fueUsado = true
            return descuento * unPrecio * 0.01
    }

    method fueUsado()= fueUsado
    method estaDisponible(){
        return !fueUsado
    }
}

/*
// usuarios
atributos:
"los usuarios tienen cupones"--> coleccion de cupones 
(puede haber repetidos? el orden no importa porque se agarra al azar por lo que es CONJUNTO)
nombre, dinero disponible, puntos, nivel y productos en su carrito (colección)

nivel son tres dependen de los puntos que tiene el usuario, e imponen un límite de productos en su carrito
-bronce: 1 producto
-plata: 5 productos, tener 5000 puntos
-oro: no hay mínimo de productos, tener 15000 puntos

métodos:
agregar al carrito un producto
comprar productos de su carrito:
- aplicar un cupón no usado al total
- restar total a dinero disponible
- sumar 10% del total a sus puntos
*/
class NivelConLimite{
    const limiteDeProductos
    method hayEspacio(unUsuario)= unUsuario.cantidadDeProductos() < limiteDeProductos
    //method hayEspacio(unCantidad)= unaCantidad < limiteDeProductos
}

const bronce = new NivelConLimite(limiteDeProductos=1)
const plata = new NivelConLimite(limiteDeProductos=5)

object oro{
    method hayEspacio(unUsuario){
        return true
    }
}

class Usuario{
    const nombre
    var dineroDisponible
    var puntos
    var nivel //por composición
    const cupones //conjunto
    const productos //no especifica si conjunto o lista

    method agregarAlCarrito(unProducto){
        //hay que ver si dependiendo el nivel, tiene espacio para agregar al carrito, el usuario NO se encarga de ver tieneEspacio
        if(nivel.hayEspacio(self)) 
        //if(nivel.hayEspacio(self.cantidadDeProductos())) 
        {productos.add(unProducto)}
        else{
            throw new NoHayEspacioException(message="No hay espacio en el carrito por tu nivel tan bajo :/")
        }
    }
    method cantidadDeProductos()= productos.size()

    method comprarProductosDelCarrito(){
        var totalAPagar = productos.map({unProducto => unProducto.precioFinal()}).sum()
        //aplicar un cupón no usado al total
        const cupon = self.cuponDisponible()
        totalAPagar -= cupon.aplicarCupon(totalAPagar)
        //restar total a dinero disponible
        dineroDisponible -= totalAPagar
        //sumar 10% del total a sus puntos
        puntos += 10*totalAPagar/100
        productos.clear()
    }
    method cuponDisponible() {
        return cupones.filter( { unCupon => unCupon.estaDisponible() } ).anyOne()
    }

    method esMoroso()=dineroDisponible<0
    method penalizar(){
        puntos-=1000
    }
    /*
    method eliminarCuponesUsados(){
        cupones.filter({cupon=>cupon.fueUsado()}) //se queda con los cupones usados
    }
    method actualizarNivel(){
        if(puntos>15000){
            nivel = oro
        }
        if else(puntos>5000 && puntos<15000){
            nivel = plata
        }
        else{
            nivel = bronce
        }
    }
    */
    method eliminarCuponesUsados(){
        cupones.removeAllSuchThat({ unCupon => !unCupon.estaDisponible() })
    }

    method actualizarNivel(){
        nivel = self.nivelCorrespondiente()
    }

    method nivelCorrespondiente(){
        if ( puntos < 5000   ) return bronce 
        if ( puntos <  15000 ) return plata
        return oro
    }

}

class NoHayEspacioException inherits Exception{}

/*
//PdePLibre
conoce todos los usuarios y todos los productos
métodos:
reducir puntos a usuarios morosos 
(si dinero disponible es negativo, se le resta 1000 puntos)
eliminar cuponess usados
obtener nombres de oferta de sus productos 
(al principio de muebles e indumentaria se pone SUPER OFERTA
al final de gangas se pone COMPRAME POR FAVOR)
actualizar NivelConLimitees de todos los usuarios
*/
class PdePLibre{
    const productos //lista puede haber repetidos
    const usuarios //conjunto no puede haber repetidos

    method castigarUsuariosMorosos(){
        usuarios.filter({usuario => usuario.esMoroso()}).forEach({usuario=> usuario.penalizar()})
    }
    method eliminarCuponesUsadosDeLosUsuarios(){
        usuarios.forEach({usuario=>usuario.eliminarCuponesUsados()})
    }
    method nombresDeProductosEnOfertas(){
        //refiere a todos los productos poner el nombre, o hacer una lista con los que tengan adelante o atrás oferta?
        return productos.map({ unProducto => unProducto.nombreEnOferta() })
    }
    method actualizarNivelConLimite(){
        usuarios.forEach({usuario=>usuario.actualizarNivel()})
    }
}
//https://www.plantuml.com/plantuml/uml/SyfFKj2rKt3CoKnELR1Io4ZDoSa700001