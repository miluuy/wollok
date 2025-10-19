//https://docs.google.com/document/d/1E9wfEvoxYP9xE8I98DNfMjLCUQWLH7qy47zu5PZE2rQ/edit?tab=t.0#heading=h.7gdntp1udhok
object riley{
    var nivelDeFelicidad = 1000
    var emocionDominante = "alegria"
    const recuerdosDelDia = []
    const pensamientosCentrales = #{}

    method vivirUnEvento(suRecuerdo){
        recuerdosDelDia.add(suRecuerdo)
    }
    method asentarRecuerdo(unRecuerdo){
        unRecuerdo.emocionDominante().consecuencias(self, unRecuerdo)
        //dependiendo la emocion dominante del recuerdo hay consecuencias
    }
    method nivelDeFelicidad()=nivelDeFelicidad
    method agregarPensamientoCentral(unRecuerdo){
        pensamientosCentrales.add(unRecuerdo)
    }

    method conocerRecuerdosRecientes()= self.mostrarUltimosRecuerdos()
 //add agrega al final y take toma los primeros n elementos
 // por lo que no se puede hacer recuerdosDelDia.take(5)
    method mostrarUltimosRecuerdos()= recuerdosDelDia.drop(recuerdosDelDia.size()-5)
 
    method pensamientosCentrales()=pensamientosCentrales
    method pensamientosDificilDeExplicar()= pensamientosCentrales.filter({unPensamiento=>unPensamiento.esDeficilDeExplicar()})
}

class Evento{
    const descripcion //no es la emoción 
    const fecha = new Date()
    const emocionDominante

    method esDeficilDeExplicar()= descripcion.words() > 10
    method emocionDominante()= emocionDominante
//dice que se asuma que los string entieneden un mensaje words 
//que supongo que da la cantidad de palabras
}
object alegria{
    method consecuencias(unaPersona,unRecuerdo){
        if (unaPersona.nivelDeFelicidad()>500){
            unaPersona.agregarAPensamientoCentral(unRecuerdo)
        }
    }
}
