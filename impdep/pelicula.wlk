import artista.*
import experiencia
import genero
class Pelicula{
    const nombre
    const elenco =#{}
    const genero

    method presupuesto() = self.sueldosDelElenco() + self.extraDel70Porciento() + genero.presupuestoExtra()
    method sueldosDelElenco()= elenco.sum({unArtista=>unArtista.sueldo()})
    method extraDel70Porciento()= 70* self.sueldosDelElenco() /100
    /*method presupuesto(){
        if(genero=="accion"){
            return self.presupuestoMinimo() + 1000*genero.cantidadDeVidriosRotos()
        }
        else{return self.presupuestoMinimo()} 
 //presupuestoMinimo es el presupuesto que no está en comentario sin el genero.presupuestoExtra()
 //por repetición de lógica (?, opté por la otra opción
     } */

    method ganancias()= self.loQueRecaudo() - self.presupuesto()
    method loQueRecaudo() = 1000000 + genero.recaudoExtra(self)
    method rodarPelicula(){
        elenco.forEach({unArtista=>unArtista.actuar()})
    }

    method cantidadDeArtistas() = elenco.size()
    method cantidadDeLetras()= nombre.size()

    method esBarata()= self.presupuesto() < 500000

}

