=begin

Problema:
Tienes un arreglo de números mezclados. Necsitas escribir un script que:
1. Filtre úniamente los números impares.
2. Multiplique cada número impar por sí mismo (Elevarlo al cuadrado)
3. Imprima el resultado final en la consola

Datos de Prueba: numero = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Resultado esperado: [1, 9, 25, 49, 81]

=end


# Opción 1:

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

resultados_one = []

numeros.each do |numero|
    if numero.odd?
        cuadrado = numero * numero

        resultados_one << cuadrado
    end
end

p resultados_one


# Opción 2:
resueltados_two = numeros.select { |n| n.odd? }.map { |n| n * n }

p resueltados_two