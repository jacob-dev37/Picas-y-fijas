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

puts generar.join
