import adulto.*
import jaloguin.noHayCaramelosExcepcion.NoHayCaramelosException

//https://drive.google.com/file/d/1d_T1Yr09aum2PJ78KcHX7Wi6n95wd9Il/view
class Niño{
    const elementos = #{}
    var actitud
    var cantidadDeCaramelos

    method capacidadDeAsustar()= self.sustosDeElementos() * actitud
    method sustosDeElementos() = elementos.sum({unElemento=>unElemento.susto()})

    method asustarAUnAdulto(unaPersona){
        if (unaPersona.seAsusta(self)){
//cantidadDeCaramelos += unaPersona.darCaramelos()
            self.aumentarCaramelos(unaPersona.darCaramelos())
        }
    }
    method aumentarCaramelos(unaCantidad){
        cantidadDeCaramelos += unaCantidad
    }
    method tieneMasCaramelosQue(unaCantidad)= cantidadDeCaramelos > unaCantidad

    method cantidadDeCaramelos() = cantidadDeCaramelos

    method elementos()= elementos

    method comerCaramelos(unaCantidad){
        if(cantidadDeCaramelos.size()<unaCantidad) {
            throw new NoHayCaramelosException(message="No hay suficiente cantidadDeCaramelos para comer :/ ")
        } 
        else{
            cantidadDeCaramelos -= unaCantidad
        }
    }
    /*
    var salud= "sano"
    method comer10CaramelosJuntos(){
    self.comerCaramelos(10)
    if (salud=="sano") {
    salud="empachado"
    actitud = actitud/2 }
    else if(salud=="empachado"){
    salud = "estar en cama" 
    actitud = 0 }
    */
}

class maquillaje{
    var property susto = 3
}

class traje{
    var esTierno=false
    method esTierno(unValor){
        esTierno = unValor
    }
    method susto(){
        if(esTierno){
            return 2
        }
        else{
            return 5
        }
    }
}

