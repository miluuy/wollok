//https://docs.google.com/document/d/1z6TUailAWpRV2Gu72vHCoHKDniFETWOWOOnzTeLVcEk/edit?tab=t.0
// FALTA EL PUNTO 5 Y EL TEST G
object springfield{
    var property centralesEnergeticas = #{burns,exBosque,elSuspiro}
    const property viento = 10
    const property riquezaSuelo = 0.9

    method centralesContaminantes(){
        return centralesEnergeticas.filter({centralEnergetica => centralEnergetica.contaminacion()})
    }
    method cubrioNecesidadEnergetica(necesidad)= necesidad <= self.produccionEnergeticaTotal()
    method produccionEnergeticaTotal() = centralesEnergeticas.map({central=>central.produccionEnergetica()}).sum()
    method estaEnElHorno(necesidad){
       //centrales contaminantes aportan más del 50% o todas las centrales son contaminantes
       return self.aportaMasDeLoNecesario(necesidad) || self.sonTodasLasCentralesContaminantes()
    }
    method aportaMasDeLoNecesario(necesidad){
        // considerar la produccion de la contaminantes. el total es el 100, el de las contaminantes es el 50?
        self.cubrioNecesidadEnergetica(30)
        return self.centralesContaminantes().map({central=>central.produccionEnergetica()}).sum()*100/self.produccionEnergeticaTotal() > 50
    }
    method sonTodasLasCentralesContaminantes(){
        //centralesEnergeticas.all({centralElectrica => centralElectrica.contaminacion()})
        //pero repite lógica el bloque
        return self.centralesContaminantes().size() == centralesEnergeticas.size()
    }

    //method centralQueMasProduce(){
        //return centralesEnergeticas.sortBy({central1,central2=>central1.produccionEnergetica()>=central2.produccionEnergetica()}).head()
    
    //}
}

object burns{
    var property cantidadDeVarillas = 100
    method produccionEnergetica() = 0.1 * cantidadDeVarillas
    method contaminacion() = cantidadDeVarillas > 20
}

object exBosque{
    var property capacidad = 100
    method produccionEnergetica() = 0.5 + capacidad * springfield.riquezaSuelo()
    method contaminacion(){
        return true
    }
}

object elSuspiro{
    var turbinas = 1

    method produccionEnergetica(){
        if(turbinas>0){
            return self.produccionDeTurbinas()
        }
    }
    method produccionDeTurbinas()= turbinas * 0.2 * springfield.viento()
    method contaminacion(){
        return false
    }
}

// intento punto 5
object albuquerque{
    const property caudal = 150
    const centralesEnergeticas = #{hidroelectrica}
}
object hidroelectrica{
    method produccionEnergetica() = 2 * albuquerque.caudal()
}

object region{
    const ciudades = #{springfield,albuquerque}
}