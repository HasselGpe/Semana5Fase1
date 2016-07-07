require 'csv'

class Maraton
  def self.controller
    $ask = CSV.read("cards.csv")
    $ask.delete_if {|x| x.empty?}
    $buenas = 0
    $malas = 0
    Maraton.preguntas
    puts ""
    puts "Acabaste: "
    puts "Tuviste #{$buenas} Correctas y #{$malas} Incorrectas."
    puts "Si tienes menos de 5, Aun tienes mucho que aprender"
    puts ""
    puts "Si tienes de 5 a 10, Vas por buen camino"
    puts ""
    puts "Si tienes de 10 a 15, Eres una Fan"
    puts ""
    puts "Si tienes obtuviste las mas de 15 preguntas buenas eres una Harmonizer"
    puts "Gracias por jugar."  
    puts ""
  end
  def self.preguntas
    until $ask.empty?
      $answer = $ask.pop(2).flatten
      puts ""
      puts "Pregunta"
      puts $answer[0]
      Maraton.respuestas
    end
  end
  def self.respuestas
    print "Intento:  "
    @intento = gets.chomp
    if @intento == $answer[1]
      puts "¡Correcto!"
      $buenas += 1
    else
      puts "¡Incorrecto!"
      $malas += 1
    end
  end
end
puts "Bienvenido a el test ¿QUE TAN HARMONIZER ERES? ... Te daremos una pregunta y deberás decir la respuesta correcta."  
puts "Arranca el juego!"
Maraton.new
Maraton.controller


