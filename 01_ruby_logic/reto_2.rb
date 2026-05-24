=begin

Problema: Imagina que estás procesando datos de un sistema de ventas. Tienes un inventari de productos
donde cada producto tiene un nombre y una cantidad disponible

Los datos:
- teclado mecanico = 15
- raton inalambrico = 3
- monitor 4k = 0
- cable hdmi = 42
- silla ergonomica = 1

Objetico:
Escribir un escript que analice este inventario e imprima tres mensajes diferentes dependiendo
del stock de cada producto

1. Si el stock es mayor a 10: Imprimir "El producto [NOMBRE] tiene stock suficiente"
2. Si el stock está entre 1 y 10: Imprimir "Alerta El producto [NOMBRE] tiene stock bajo"
3. Si el stock es 0: Imprimir "Urgente el produto [NOMBRE] esta agotado"

=end


#Opcion 1:

# 1. Definimos nuestro inventario
inventory = {
    "teclado mecanico" => 15,
    "raton inalambrico" => 3,
    "monitor 4k" => 0,
    "cable hdmi" => 42,
    "silla ergonomica" => 1
}

# 2. Usamos .each donde declaramos dos variables dentro de las barras | |
inventory.each do |product, amount| 

    # Estructura de control: if / elsif / else
    if amount == 0

        # La interpolacion en Ruby se hace con #{variable} dentro de comillas ""
        puts "Urgente el producto #{product} esta agotado."

    elsif amount > 0 && amount <= 10
        
        puts "Alerta el producto #{product} tiene stcok bajo"

    else 
        puts "El producto #{product} tiene stock suficiente"
    end
end


#Opcion 2:
=beging
Ruby tiene una estructura llamada case / when similar a swith en otros lenguajes, permite evaluar rangos
Un rango en Ruby se escribe con dos puntos 1..10, del 1 al 10.
=end

inventory.each do |product, amount|
    case amount
    when 0
        puts "URGENTE: El producto #{product} esta agotado"
    when 1..10
        puts "ALERTA: El producto #{product} tiene stock bajo"
    else
        puts "El procucto #{product} tiene stock suficiente"
    end
end