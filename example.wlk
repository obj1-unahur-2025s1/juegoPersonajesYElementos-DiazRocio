object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}

object castillo {
  var nivelDeDefensa = 150
  method altura() = 20
  method nivelDeDefensa() = nivelDeDefensa
  method recibirAtaque(potencia){
    nivelDeDefensa -= potencia //lo mismo que nivelDeDefensa = nivelDeDefensa - potencia
  }
  method recibirTrabajo() {
    nivelDeDefensa = 200.min(nivelDeDefensa + 20) //devuelve el mínimo entre los 2 valores
  }
  method darValor() = nivelDeDefensa / 5
}

object aurora {
  var estaViva = true
  method altura() = 1
  method estaViva() = estaViva
  method recibirAtaque(potencia){
    estaViva = potencia < 10 //aurora está viva cuando la potencia sea menor que 10 - estaViva = not(potencia >= 10)
  }
  method darValor() = 15
  method recibirTrabajo(){
    //no le pasa nada
  }
}

object tipa {
  var altura = 8
  method altura() = altura
  method recibirAtaque(potencia) {
    //cuando la atacan no le pasa nada, pero tiene que entender el mensaje
  }
  method darValor() = altura * 2
  method recibirTrabajo() {
    altura = altura + 1
  }
}

object floki {
  method arma() = ballesta
  method encontrar(elemento) {
    if (self.arma().estaCargada()) {
      self.arma().usar()
      elemento.recibirAtaque(self.arma().potencia()) //self es la referencia a si mismo, ya que el metodo arma podria referirse a otro personaje
    }
  }
}

object mario {
  var ultimoElemento = null //null no entiende altura, verificar como se inicializa
  var valorRecolectado = 0
  method encontrar(elemento) {
    valorRecolectado += elemento.darValor()
    elemento.recibirTrabajo()
    ultimoElemento = elemento
  }
  method esFeliz() = (valorRecolectado >= 50) or (ultimoElemento.altura() >= 10)
}

object luisa {
  var personajeActivo = floki //pongo un personaje por defecto
  method personajeActivo(personaje) {
    personajeActivo = personaje
  }
  method personajeActivo() = personajeActivo
  method aparece(elemento) {
    personajeActivo.encontrar(elemento)
  }
}

object ballesta {
  var cantidadDeFlechas = 10
  method estaCargada() = cantidadDeFlechas > 0
  method potencia() = 4
  method usar() {
    cantidadDeFlechas -= 1
  }
}

object jabalina {
  var estaCargada = true
  method estaCargada() = estaCargada
  method potencia() = 30
  method usar() {
    estaCargada = false
  }
}
