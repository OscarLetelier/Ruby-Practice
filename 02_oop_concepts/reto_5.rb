=begin
    
    Vamos a modelar la logica basica de un carrito de compras. Para esto necesitamos dos Clases

    1. Product: Representa un articulo individualcon su nombre y precio
    2. ShoppingCart: Representa el carrito de un cliente, que puede contener multiples productos y calcular
    el total a pagar

    PASO 1: La logica (Seudocodigo)
        1. Clase Product: Solo necesita saber como inicializarse (initialize) con un @name y un @price
        y exponerlos para que otros puedan leerlos usando (attr_reader)
        
        2. Clase ShoppingCart: Su estado inicial (constructor) debe ser una lista vacia de articulos
        (@items = [])
            - Necesita un metodo add_items que reciba un objeto de tipo Producto y lo guarde en la lista
            - Necesita un metodo calculate_total que recorra todos los productos guardados en @items,
            sume sus precios y devuelva el total.


    PASO 2: Solución Estructurada 

OPCIÓN 1:

=end

class Product
    attr_reader :name, :price
    
    def initialize(name, price)
        @name = name
        @price = price
    end
end

class ShoppingCart
    attr_reader :items

    def initialize
        @items = []
    end

    def add_items(product)
        @items << product
        puts "Added `#{product.name}` to the cart."
    end

    def calculate_total
        total = 0
        @items.each do |item|
            total += item.price
        end
        total
    end
end

#=== PRUEBA DE LA INTERACCION ===

# Creamos instancias de Product
laptop = Product.new("Macbook Pro", 2500)
mouse = Product.new("Logitech MX", 1001)
keyboard = Product.new("Keychron K2", 80)

# Creamos una iunstancia de ShoppingCart
my_cart = ShoppingCart.new

# Agregamos los productos al carrito
my_cart.add_items(laptop)
my_cart.add_items(mouse)
my_cart.add_items(keyboard)

puts "Total to Pay: #{my_cart.calculate_total} USD"



# OPCION 2:

def calculate_total_new
    # En lugar de crear un contador e iterar, usamos .sum
    # Le pasamos un bloque que le dice "que atributo" debe sumar
    @items.sum { |item| items.price}
end

puts "Total to Pay: #{my_cart.calculate_total_new} USD"




