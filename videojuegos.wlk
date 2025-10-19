// https://docs.google.com/document/d/11_PIuru6hAmbN1QSKpC7KDvc7IduOyBcbbVez2M8v_U/edit?tab=t.0#heading=h.vzdoln7mwnea
object delfina {
    var property nivelDeDiversion = 0
    var property consolaAMano = play

    method agarrar(consola){
        consolaAMano = consola
    }
    method jugar(videojuego){
        nivelDeDiversion += videojuego.diversion()
        consolaAMano.usar()
    }
}

object play {
    method jugabilidad()=10
    method usar(){}
}
object portatil {
    var bateria = "cargada"
    method jugabilidad(){
        if (bateria != "bateria baja")
        {return 8}
        else { return 1}
    }
    method usar(){
        bateria = "bateria baja"
    }
}

object arkanoid {
    method diversion () =50
}

object mario {
    method diversion () {
        if (delfina.consolaAMano().jugabilidad() > 5){
            return 100
        }
        else { return 15}
    }
}

object pokemon {
    method diversion ()= 10 * delfina.consolaAMano().jugabilidad()
}