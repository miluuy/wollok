import niño.*
import jaloguin.noHaySuficienteMiembrosException.NoHaySuficientesMiembrosException

class Legion{
    const miembros = #{}

    method capacidadDeAsustar()= miembros.sum({unNiño=>unNiño.capacidadDeAsustar()})
    method cantidadDeCaramelos()= miembros.sum({unNiño=>unNiño.cantidadDeCaramelos()})
    method asustarAUnAdulto(unaPersona){
        if (unaPersona.seAsusta(self)){ 
//seAsusta sirve para solo un niño, pero por polimorfismo funciona
            self.lider().aumentarCaramelos(unaPersona.darCaramelos())
        }
    }
    method lider()= miembros.max({unNiño=>unNiño.capacidadDeAsustar()})

    method crearLegion(unosNiños){
        if(unosNiños.size()<2){
            throw new NoHaySuficientesMiembrosException (message= "Debe haber al menos dos niños por legión!")
        }
        else{
            miembros.addAll(unosNiños)
        }
    }
    // crearLegion sirve para agregar nuevas legiones a otra legión
}