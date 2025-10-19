// https://docs.google.com/document/d/12-nwknWda3HGG6r4vw-tDM_wmUnPUr0b4_i9WUJ8vhg/edit?pli=1&tab=t.0#heading=h.hayhufx5p0at
// PdePLibre

class Producto{
    const nombre
    const precioBase

    method precioFinal()= precioBase + self.iva()
    method iva()=21*precioBase *0.01
}

class Mueble inherits Producto{
    override method precioFinal(){
        return super() + 1000
    }
}

class Indumentaria inherits Producto{
    var temporadaActual = false

    method temporadaActual()=temporadaActual
    method temporadaActual(valor)=valor

    override method precioFinal(){
        if(self.temporadaActual()){
            return super() + 10*precioBase*0.01
        }
        else{
            return super()
        }
    }
}

class Ganga inherits Producto{
    override method precioFinal()=0
}

class Cupon{
    var fueUsando = false
    const porcentaje

    method usarCupon(precioTotal){
        if(!fueUsado){
            fueUsado = true
            return precioTotal - porcentaje*precioTotal*0.01
        }
    }
}

class Usuario{
    const nombre
    var dineroDisponible
    var puntos
    var nivel
    const productos

    method agregarAlCarrito(producto){
        if(self.tieneEspacio())
        productos.add(producto)
    }
    method tieneEspacio() = productos.size() < nivel.maximoProductos

    method comprarProductos(){
        dineroDisponible -= cupon.usarCupon(productos.map({producto->producto.precioFinal()}).sum())
        // sumar a sus puntos el 10% del valor de la compra
        productos.clear()
    }

}

//segun la cantidad de puntos a qué nivel pertenece
object bronce {
    const maximoProductos=1

    method maximoProductos()=maximoProductos
}

object plata {
    const maximoProductos=5

    method maximoProductos()=maximoProductos
}

object bronce {
    const maximoProductos=inf

    method maximoProductos()=maximoProductos
}

