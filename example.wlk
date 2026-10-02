import elementos.*

class Plagas {
    var poblacion
 
    method nivelDeDaño() 
    method transmitenEnfermedad() = poblacion >= 10 && self.condicionAdicional()
    method condicionAdicional() 
    method ataque(unElemento) {
        unElemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.1
    }
}

class Cucarachas inherits Plagas {
    var pesoPromedio

    override method nivelDeDaño() {
        poblacion / 2
    }
    override method condicionAdicional() {
        pesoPromedio >= 10  
    }
    override method ataque(unElemento) {
        super(unElemento)
        pesoPromedio += 2
    }

}

class Pulgas inherits Plagas {

    override method nivelDeDaño() {
        poblacion * 2
    }
    override method condicionAdicional() = true
}

class Garrapatas inherits Pulgas {

    override method ataque(unElemento) {
        unElemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.2
    }
}

class Mosquitos inherits Plagas {
    override method nivelDeDaño() {
        poblacion
    }
    override method condicionAdicional() {
        poblacion % 3 == 0
    }
}
