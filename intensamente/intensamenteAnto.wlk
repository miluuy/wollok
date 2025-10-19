class Recuerdo {
    const descripcion
    const fecha
    const emocion

    method asentarRecuerdo(unaPersona) {
        emocion.consecuencias(unaPersona,self)
    }
   }

object triste {
    method consecuencias(unaPersona,unRecuerdo) {
        unaPersona.agregarPensamientoCentral(unRecuerdo)
        unaPersona.disminuirFelicidad(0.1 * unaPersona.felicidad())
    }
}

class Emocion {
    method consecuencias(unaPersona,unRecuerdo) {}
}

const disgusto = new Emocion()
const furioso = new Emocion()
const temeroso = new Emocion()

object alegria {
    method consecuencias(unaPersona,unRecuerdo) {
        if(unaPersona.estaFeliz()) {
            unaPersona.agregarPensamientoCentral(unRecuerdo)
        }
    }
}

class Riley {
    var felicidad = 100
    var emocionDominante 
    const recuerdosDelDia = []
    const pensamientosCentrales = #{}

    method vivirEvento(unRecuerdo) {
        recuerdosDelDia.add(unRecuerdo)
    }

    method pensamientosCentrales() {
        return pensamientosCentrales 
    }

    method pensamientosCentralesDificiles() {
        return pensamientosCentrales.filter({unRecuerdo => unRecuerdo.esDificil()})
    }
    method recuerdosRecientesDelDia() {
        return recuerdosDelDia.last(5)
    }
}