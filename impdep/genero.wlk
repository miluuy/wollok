import pelicula.*
class Genero{
    method presupuestoExtra()=0
    method recaudoExtra(unaPelicula)
}
object accion inherits Genero{
    var cantidadDeVidriosRotos=0
    override method presupuestoExtra()= 1000 * cantidadDeVidriosRotos
    override method recaudoExtra(unaPelicula)= 50000 * unaPelicula.cantidadDeArtistas()
}
object drama inherits Genero{
    override method recaudoExtra(unaPelicula)=100000 * unaPelicula.cantidadDeLetras()
}
object terror inherits Genero{
    var cantidadDeCUCHO=0
    override method recaudoExtra(unaPelicula)= 20000 * cantidadDeCUCHO
}
object comedia inherits Genero{
    override method recaudoExtra(unaPelicula)=0
}