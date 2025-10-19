import pelicula.*
import artista
object impdep{
    const artistas = #{}
    const peliculas = #{}

    method elArtistaMejorPagado()= artistas.max({unArtista=>unArtista.sueldo()})
    method peliculasEconomicas()= peliculas.filter({unaPelicula=>unaPelicula.esBarata()})
    method gananciasDePeliculasEconomicas()= self.peliculasEconomicas().sum({unaPelicula=>unaPelicula.ganacias()})
    method recategorizarArtistas(){
        artistas.forEach({unArtista=>unArtista.recategorizarExperiencia()})
    }
}

// para conseguir la lista de artistas habría que hacerla como 
//agregando el elenco de todas las peliculas almacenadas
// y luego flatten().asSet() ???