#Juego de adivinar numero recibiendo algunas pistas
def titulo
puts ' ____        _____'
puts '|  _ \\ _   _|  ___|'
puts '| |_) | | | | |_   '
puts '|  __/| |_| |  _|  '
puts '|_|    \\__, |_|    '
puts '       |___/'
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
        puts "Picas: #{picas}"
        puts "Fijas: #{fijas}"
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
puts "Felicidades, ganaste!"
