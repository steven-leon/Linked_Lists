require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      tail.next_node = new_node
    end
  end

  def prepend(value) #prepend = anteponer
    new_node = Node.new(value, @head) #aqui recibe un nuevo valor y el @head actual
    @head = new_node
  end

  def size
    count = 0
    current = @head
    while current #Iteramos hasta que `current` sea `nil` (final de la lista)
      count += 1
      current = current.next_node # Avanzamos al siguiente nodo
    end
    count
  end

  def tail
    return nil if @head.nil? # Evita intentar recorrer una lista vacía, devuelve nil si head es nulo

    current = @head
    current = current.next_node while current.next_node
    # La condición del while es current.next_node, lo que significa
    # que el bucle continuará mientras el nodo actual tenga un siguiente nodo.
    # ✅ En cada iteración, current avanza al siguiente nodo (current = current.next_node).
    current
    #ejm:primero enviame dog a def append(value), entonces seria @head = new_node(dog), a la siguiente mandamos cat como argumento
    #tail.next_node = new_node, aqui se vuekve tail(dog).next_node = new_node(cat)
  end

  def at(index)
    current = @head
    i = 0
    while current
      return current if i == index #Si el índice coincide con `i`, retornamos el nodo actual
      current = current.next_node
      i += 1
    end
    nil
  end

  def pop
    # Elimina el último nodo de la lista enlazada.
    # ✅ Si la lista tiene un solo nodo, la vacía completamente (@head = nil).
    # ✅ Si la lista está vacía, retorna nil.
    return nil if @head.nil? # Si la lista está vacía, retornamos nil
    return @head = nil if @head.next_node.nil? # Si hay solo un nodo, vaciamos la lista

    current = @head
    current = current.next_node while current.next_node.next_node # Recorremos hasta el penúltimo nodo, ya que "nil" cuenta como un valor
    current.next_node = nil # Eliminamos el último nodo
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    # ✅ Convierte la lista enlazada en un formato de texto legible, mostrando los nodos en orden.
    # ✅ Permite imprimir la lista en un formato claro con " -> " entre los elementos.
    result = ""
    current = @head
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result += "nil"
    result
  end

  # Extra credit

  def insert_at(value, index)
    return prepend(value) if index == 0 # Si el índice es 0, usamos `prepend` para insertarlo al inicio

    prev = at(index - 1) # Buscamos el nodo anterior a la posición donde queremos insertar
    return nil unless prev # Si no existe ese nodo (índice fuera de los límites), retornamos nil

    new_node = Node.new(value, prev.next_node) # Creamos un nuevo nodo apuntando al siguiente nodo de `prev`
    prev.next_node = new_node # Conectamos el nuevo nodo en la lista
  end

  def remove_at(index)
    return @head = @head.next_node if index == 0 #  Si el índice es 0, eliminamos la cabeza

    prev = at(index - 1)
    return nil unless prev && prev.next_node # Si no existe, o si no hay siguiente nodo, retornamos nil
    # La clave está en el operador &&, que significa "y". ✅ La función se detendrá (return nil)
    # si cualquiera de las dos condiciones es falsa. ✅ Para que el código continúe ejecutándose, ambas condiciones deben ser verdaderas.

    prev.next_node = prev.next_node.next_node # aqui movemos el index actual, ddigamos es gato, y lo cambiamos por el siguiente
    # perro - gato - loro, ahora seria, perro y loro, gato desaparece
  end
end
