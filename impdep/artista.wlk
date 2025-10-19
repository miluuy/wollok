class Artista{
    var experiencia
    var cantidadDePeliculasQueActuo
    var ahorros

    method sueldo() = experiencia.sueldoCorrespondiente(self)
    method cantidadDePeliculasQueActuo()=cantidadDePeliculasQueActuo
    /*
    method sueldo(){
    if(experiencia=="amateur"){
        return 10000
        }
    else if(experiencia=="ya está establecido"){
        if(self.nivelDeFama<15){
            return 15000}
        else{ 
            return 5000 * self.nivelDeFama()}
        }
    else{ return 30000 * cantidadDePeliculasQueActuo}
    }
    */
    method nivelDeFama()= cantidadDePeliculasQueActuo/2
    
    /*
    Debe poder recategorizar su experiencia en el caso de que sea posible:
Si es amateur, podemos decir que se estableció cuando ya tenga más de 10 películas actuadas.
Si ya se estableció, sólo podrá hacerlo si su nivel de fama es mayor a 10 
y podremos decir que estamos ante una estrella.
Una estrella nunca debe poder recategorizarse 
y en el caso de intentar hacerlo, se deberá lanzar un error.
*/
    method recategorizarExperiencia(){
        //experiencia = self.experienciaCorrespondiente()
    }
   /* method experienciaCorrespondiente(){
        if(experiencia.nombre() == "amateur" && cantidadDePeliculasQueActuo>10){ return yaEstaEstablecido }
        if(experiencia.nombre() == "yaEstaEstablecido" && self.nivelDeFama()>10){ return estrella }
        if(experiencia.nombre() == "estrella"){ throw new SosEstrellaException(message="Ya sos estrella, qué más querés ami")}
        else{
        //no se hace ningún cambio
        }
    }

//class SosEstrellaException inherits Exception{}
*/

    method actuar(){
        cantidadDePeliculasQueActuo += 1
        ahorros += self.sueldo()
    }
}

