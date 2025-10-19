//https://docs.google.com/document/d/1VWjnxw1aOuve_oRyB55AU5LK3XDvln2uKEq_HnL3710/edit?tab=t.0

class Pajaro{
    var ira

    method enojar(){
        ira *=2
    }
    method fuerza()= ira*2
    method esFuerte() = self.fuerza()>50

    method tranquilizar(){
        0.max(ira-5)
    }

    method esHomenajeado(){}

    method puedeDerribar(unObstaculo)= self.fuerza() > unObstaculo.resistencia()

    method lanzar(unaIsla){
        const unObstaculo = unaIsla.obstaculos().first()
        if(self.puedeDerribar(unObstaculo)){
            unaIsla.obstaculos().remove(unObstaculo)
        }
    }
}

class Red inherits Pajaro{
    var vecesQueSeEnojo
    override method fuerza()= ira * 10 * vecesQueSeEnojo
}

class Bomb inherits Pajaro{
    var maximoDeFuerza = 9000
    override method fuerza()=super().min(maximoDeFuerza)
    method maximoDeFuerza(unMaximo){
        maximoDeFuerza = unMaximo
    }
}

class Chuck inherits Pajaro{
    var velocidad
    override method fuerza(){
        if(velocidad <=80){
            return 150
        }
        else{
            return 150 + 5 * (velocidad-80)
        }
    }
    override method enojar(){
        //también se duplica la ira por el inicio de Cuidado con los pájaros?
        super()
        velocidad *=2
    }
    override method tranquilizar(){}
}

class Terence inherits Pajaro{
    var vecesQueSeEnojo
    var multiplicador

    method multiplicador(unValor){
        multiplicador = unValor
    }
    override method fuerza()= ira * multiplicador * vecesQueSeEnojo
}

class Matilda inherits Pajaro{
    const pesoDeHuevosQuePuso = []

    override method fuerza()= super() + self.fuerzaDeTodosLosHuevos()
    method fuerzaDeTodosLosHuevos()= pesoDeHuevosQuePuso.sum()
    override method enojar(){
        super()
        pesoDeHuevosQuePuso.add(2)
    }
    //el peso del huevo es igual a la fuerza del huevo
}
/*
//considerando el Huevo como una clase
class Matilda inherits Pajaro {
    const huevos 

    override method fuerza() {
        return super() + self.sumaDeFuerzaDeTodosLosHuevos()
    }

    method sumaDeFuerzaDeTodosLosHuevos() {
        return huevos.sum({unHuevo => unHuevo.fuerza()})
    }

    override method enojar() {
        super()
        const unHuevo = new Huevo(peso=2)
        huevos.add(unHuevo)
    }
}
class Huevo{
    var peso
    method fuerza()=peso
    }
*/

object islaPajaros{
    const pajaros = #{}
    method pajarosFuertes()= pajaros.filter({unPajaro => unPajaro.esFuerte()})
    method fuerzaDeLaIsla()= self.pajarosFuertes().sum({unPajaro => unPajaro.fuerza()})
   
    method sucederUnEvento(unEvento){
        unEvento.afectar(pajaros)
    }

    method atacar(islaCerdito){
        pajaros.forEach({unPajaro => unPajaro.lanzar(islaCerdito)})
    }

    method recuperaronHuevos(islaCerdito)=islaCerdito.noTienenHuevos()
}

object manejoDeIraConMatilda{
    method afectar(unosPajaros){
        unosPajaros.forEach({unPajaro => unPajaro.tranquilizar()})
    }
}

object invasionDeCerditos{
    var cantidadDeCerditosInvasores=0
    method afectar(unosPajaros){
        self.cantidadDeEnojos().times({self.enojarPajaros(unosPajaros)})
    }
    method cantidadDeEnojos()= cantidadDeCerditosInvasores/100
    method enojarPajaros(unosPajaros){
        unosPajaros.forEach({unPajaro=>unPajaro.enojar()})}
}

object fiestaSopresa{
    method afectar(unosPajaros){
        self.pajarosHomenajeados(unosPajaros).forEach({unPajaro=>unPajaro.enojar()})
    }
    method pajarosHomenajeados(unosPajaros)=unosPajaros.filter({unPajaro=>unPajaro.esHomenajeado()})
}

object eventosDesafortunados{
    const eventos=[]
    method afectar(unosPajaros){
        eventos.forEach({unEvento=>unEvento.afectar(unosPajaros)})
    }
}

object islaCerdito{
    const obstaculos=[]

    method obstaculos() = obstaculos

    method noTienenHuevos()= obstaculos.isEmpty()
}

class Pared{
    const ancho
    const unValor
    method resistencia()= unValor * ancho
}
class ParedDeVidrio inherits Pared(unValor=10){}
class ParedDeMadera inherits Pared(unValor=25){}
class ParedDePiedra inherits Pared(unValor=50){}
class CerditosObreros{
    method resistencia()=50
}
class CerditosArmados{
    var resistenciaDeArma
    method resistencia()= 10 * resistenciaDeArma
}
/*
//hace una clase de Arma
class CerditoArmado {
    const arma 
    method resistencia() {
        return 10 * arma.resistencia()
    }
}
*/

/*
PUNTO 4
Si se quisieran incorporar nuevos tipos de pájaros a la isla,
podrían ser una clase nueva que hereda de la superclase Pajaro,
por los métodos como puedeDerribar y lanzar;
si los demás difieren de como están en la superclase,
se puede hacer un override de esos métodos.
Y así la solución actual seguiría funcionando por el polimorfismo.

*/