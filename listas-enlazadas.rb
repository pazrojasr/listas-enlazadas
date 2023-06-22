class Nodo
  attr_accessor :valor, :siguiente

  def initialize(valor)
    @valor = valor
    @siguiente = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(valor)
    nodo = Nodo.new(valor)

    if @head.nil?
      @head = nodo
    else
      actual = @head
      actual = actual.siguiente while actual.siguiente

      actual.siguiente = nodo
    end
  end

  def prepend(valor)
    nodo = Nodo.new(valor)
    nodo.siguiente = @head
    @head = nodo
  end

  def size
    contador = 0
    actual = @head

    while actual
      contador += 1
      actual = actual.siguiente
    end

    contador
  end

  def head
    @head
  end

  def tail
    actual = @head

    while actual && actual.siguiente
      actual = actual.siguiente
    end

    actual
  end

  def at(index)
    contador = 0
    actual = @head

    while actual && contador < index
      actual = actual.siguiente
      contador += 1
    end

    actual
  end

  def pop
    return if @head.nil?

    if @head.siguiente.nil?
      @head = nil
      return
    end

    anterior = @head
    actual = @head.siguiente

    while actual.siguiente
      anterior = actual
      actual = actual.siguiente
    end

    anterior.siguiente = nil
  end

  def contains?(valor)
    actual = @head

    while actual
      return true if actual.valor == valor

      actual = actual.siguiente
    end

    false
  end

  def find(valor)
    contador = 0
    actual = @head

    while actual
      return contador if actual.valor == valor

      actual = actual.siguiente
      contador += 1
    end

    nil
  end

  def insert_at(valor, index)
    return prepend(valor) if index == 0

    nodo = Nodo.new(valor)
    anterior = at(index - 1)
    siguiente = anterior.siguiente

    anterior.siguiente = nodo
    nodo.siguiente = siguiente
  end

  def remove_at(index)
    return if @head.nil? || index >= size

    if index == 0
      @head = @head.siguiente
      return
    end

    anterior = at(index - 1)
    anterior.siguiente = anterior.siguiente.siguiente
  end

  def to_s
    return "nil" if @head.nil?

    actual = @head
    lista = ""

    while actual
      lista += "( #{actual.valor} ) -> "
      actual = actual.siguiente
    end

    lista += "nil"
  end
end

# Ejemplo de uso
lista = LinkedList.new
lista.append(10)
lista.append(20)
lista.append(30)
puts lista.to_s  # Resultado: ( 10 ) -> ( 20 ) -> ( 30 ) -> nil

lista.prepend(5)
puts lista.to_s  # Resultado: ( 5 ) -> ( 10 ) -> ( 20 ) -> ( 30 ) -> nil

puts lista.size  # Resultado: 4

puts lista.head.valor  # Resultado: 5

puts lista.tail.valor  # Resultado: 30

puts lista.at(2).valor  # Resultado: 20

lista.pop
puts lista.to_s  # Resultado: ( 5 ) -> ( 10 ) -> ( 20 ) -> nil

puts lista.contains?(10)  # Resultado: true

puts lista.find(20)  # Resultado: 2

lista.insert_at(15, 2)
puts lista.to_s  # Resultado: ( 5 ) -> ( 10 ) -> ( 15 ) -> ( 20 ) -> nil

lista.remove_at(1)
puts lista.to_s  # Resultado: ( 5 ) -> ( 15 ) -> ( 20 ) -> nil
