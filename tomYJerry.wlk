//https://docs.google.com/document/d/11_PIuru6hAmbN1QSKpC7KDvc7IduOyBcbbVez2M8v_U/edit?tab=t.0#heading=h.vzdoln7mwnea
object tom{
    var energia = 80
    var posicion = 0
    
    method velocidad()= 5 + energia.div(10)
    method esMasVeloz(raton){
        return self.velocidad() > raton.velocidad()
    }
    method correrA(raton){
        energia -= 0.5*self.velocidad()*self.distancia(raton)
        posicion = raton.posicion()
    }
    method distancia(raton)=(raton.posicion() - posicion).abs()
}

object jerry {
    var peso = 3
    var property posicion = 10 
    // agrego property por el mensaje que se usa en correrA de tom
    // así raton lo entiende
    method velocidad () = 10 - peso
}

object robotRaton {
    //const property velocidad = 8
    var property posicion = 12
    method velocidad()=8   
}