import niño.*

class AdultoComun{
    const muchachosQueIntentaronAsustarlo = #{}

    method seAsusta(unNiño)= self.tolerancia() < unNiño.capacidadDeAsustar()
    method darCaramelos() = self.tolerancia()/2
    method tolerancia() = 10* self.muchachosConCaramelosQueIntentaronAsustarlo()
    method muchachosConCaramelosQueIntentaronAsustarlo()= muchachosQueIntentaronAsustarlo.filter({unNiño=>unNiño.tieneMasCaramelosQue(15)}).size()
}
class Abuelo inherits AdultoComun{
    override method seAsusta(unNiño) = true
    override method darCaramelos()= super()/2
    //y entregan la mitad de los caramelos de un adulto común.
}
class AdultoNecio{
    method seAsusta(unNiño) = false
}