object poroto {
  // Estado
  var energia = 500
  const raza = "Salchicha"
  
  // Interfaz
  // Tiene efecto, no devuelve. "Orden"
  method jugar() {
    energia = energia - 20
    // energia -= 20
  }
  
  method energia(unaEnergia) { // Asigna un valor a un atributo. "Setter"
    energia = unaEnergia
  }
  
  // Devuelve, no tiene efecto. "Pregunta"
  method energia() { // Devuelve el valor de un atributo. "Getter"
    return energia
  }
  
  method raza() {
    return raza
  }
  
  method ladrido() {
    return "Wow!"
  }
}

object billy {
  var alegria = 100
  const nombre = "William"
  var mascota = poroto
  
  method jugarConSuMascota() {
    alegria = alegria + 50
    mascota.jugar()
  }
}

object sally {
  var property energia = 500
  
  method ladrido() {
    return "Miau!"
  }
  
  method jugar() {
    energia = energia - 20    
  }
}

object mandy {
  var alegria = 100
  const nombre = "Magdalena"
  var mascota = sally
  
  method jugarConSuMascota() {
    alegria += 100
    mascota.jugar()
    mascota.jugar()
  }
}