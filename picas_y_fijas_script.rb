#Juego de adivinar numero recibiendo algunas pistas
require 'tty-font'
require 'rainbow'

def titulo
texto = TTY::Font.new(:straight)
titulo = texto.write("Picas y fijas")
puts Rainbow(titulo).green.background(:lightgray)
puts "\nAdivina el numero de 4 cifras que he generado"
end
#Generar numero de 4 cifras que no se repitan
def generar
    @numero = []
    until @numero.length == 4
        cifra = rand(9)
        unless @numero.include?(cifra)
            @numero << cifra
        end
    end
    @numero
end
#Procesar respuesta del usuario
def respuesta
    @respuesta = 0
    picas = 0
    fijas = 0
    until @respuesta == @numero.join
        system("clear")
        titulo
        puts "Picas: " + Rainbow(picas).color("#FF1560").bright.blink
        puts "Fijas: " + Rainbow(fijas).color("#FF1560").bright.blink
        print "Escribe un numero de 4 cifras: "
        @respuesta = gets.chomp.chars.uniq.join
        if @respuesta.length == 4
            picas = 0
            fijas = 0
            4.times do |x|
                if @respuesta[x].to_i == @numero[x]
                    fijas += 1
                elsif @numero.include?(@respuesta[x].to_i)
                    picas += 1
                end
            end
        end
    end
end
puts generar.join
respuesta
system("clear")
puts Rainbow("Felicidades, ganaste!").green.bright.blink
