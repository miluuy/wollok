import artista.*
object amateur{
    // const nombre = "amateur"
    method sueldoCorrespondiente(unArtista)=10000
}

object yaEstaEstablecido{
    //const nombre = "yaEstaEstablecido"
    method sueldoCorrespondiente(unArtista){
        if(unArtista.nivelDeFama()<15){
            return 15000
        }
        else{ return 5000 * unArtista.nivelDeFama()}
    }
}

object estrella{
    //const nombre = "estrella"
    method sueldoCorrespondiente(unArtista)= 30000 * unArtista.cantidadDePeliculasQueActuo()
}