require_relative 'lib/node'
require_relative 'lib/linked_list'

list = LinkedList.new
list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list  # Debería mostrar: ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil
