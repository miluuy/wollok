object bb{
    const descripcion = "que onda viejo"
    const jaja= ["vela","bola","camisa"]

    method esDificil()= descripcion.size()

    method agregar(palabra){ jaja.add(palabra)}
    method jaja()=jaja
    method tomar()= jaja.take(3)
}

/*
wollok:pruebas> bb.jaja()
✓ ["vela", "bola", "camisa"]
wollok:pruebas> bb.agregar("amor")
✓ 
wollok:pruebas> bb.jaja()
✓ ["vela", "bola", "camisa", "amor"]
*/