import niño.*
class Barrio{
    const niños=[]

    method tresNiñosConLaMayorCantidadDeCaramelos(){
        return self.niñosOrdenadosPorMayorCantidadDeCaramelos().take(3) //take solo funciona para listas
    }
    method niñosOrdenadosPorMayorCantidadDeCaramelos() = niños.sortedBy({unNiño,otroNiño=>unNiño.cantidadDeCaramelos()>otroNiño.cantidadDeCaramelos()})
    method elementosUsados(){
        return self.tienenMuchosCaramelos().map({unNiño=>unNiño.elementos()}).flatten().asSet() 
    //flatten porque sino van a dar como#{#{},#{}}, y asSet para que saque a los repetidos
    }
    method tienenMuchosCaramelos() = niños.filter({unNiño=>unNiño.tieneMasCaramelosQue(10)})
}