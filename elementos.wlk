import plagas.*

class Hogar {
    var mugre 
    const confort

    method esBueno() = mugre <= confort/2

    method recibirAtaqueDe(unaPlaga) {
        mugre = mugre + unaPlaga.nivelDeDaño()
    }
}

class Huerta {
    var produccion

    method esBueno() = produccion > nivelDeCosecha.valor()

    method recibirAtaqueDe(unaPlaga) {
        produccion = produccion - (unaPlaga.nivelDeDaño() * 0.1) 
        + if(unaPlaga.transmitenEnfermedad()) 10 else 0
    }
}

class Mascota {
    var salud 

    method esBueno() = salud > 250

    method recibirAtaqueDe(unaPlaga) {
        if(unaPlaga.transmitenEnfermedad())
        {salud = salud - unaPlaga.nivelDeDaño()}  
    }
}


class Barrio {
    const property elementos = []

    method agregarUnElemento(unElemento) {
        elementos.add(unElemento)
    } 
    method quitarUnElemento(unElemento) {
        elementos.remove(unElemento)
    }

    method cantElementosBuenos() = elementos.count({e => e.esBueno()})
    method esCopado() {
        return self.cantElementosBuenos() > elementos.size() / 2 
    }
}

object nivelDeCosecha {
    var property valor = 10
}
