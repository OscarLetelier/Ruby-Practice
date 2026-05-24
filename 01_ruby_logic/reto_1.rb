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

# 1. Definimos el array de numeros
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 2. Creacmos un arreglo vacio para almacenar los resultados
resultados_one = []

# 3. Iteramos, En lugar de un bucle for usamos, el método .each
# do |numero| significa por cada iteración, guarda el valor actual en la variable "Numero"
numeros.each do |numero|

    #4. Condicional metodos integrados como .odd "¿es impar?"
    if numero.odd?

        #5. Multiplicamos y guardamos el resultado
        cuadrado = numero * numero

        # El operador << (shovel) sirve para empujar un elemento al final de un arreglo
        resultados_one << cuadrado
    end
end

#6. Imprimimos el resultado
# Usamos p en lugar de puts porque p imprime arreglos en una sola linea de forma legible
p resultados_one


# Opción 2:

# .select filtra los elemtnos que cumplen una seleccion
# .map transforma cada elemento y devuelve un nuevo arreglo con los resultados
# Las llaves { |n| ... } son bloques de una sola linea (lo mismo que do...end pero mas compacto)
resueltados_two = numeros.select { |n| n.odd? }.map { |n| n * n }

p resueltados_two

