=begin
    Siguiendo con nuestro E-Commerce sabemos que no todos los productos son iguales.
    Un libro digital E-Book no cuesta nada enviarlo, pero un libro fisico si requeire calcular
    un costo de envio Shipping

    OBJETIVO:
        1. Crear una clase base o padre llamada Product
        2. Crear una clase hija llamada DigitalProduct que herede de Product
        3. Crear una clase hija llamada PhysicalProduct que herede de Product, pero que añada 
            un atributo extra (weight / peso) y modifique la forma en que se calcula su precio final.

    PASO 1: SEUDOCODIGO
        1. La Clase padre Product: Tendra name y price, Ademas tendra un metodo
            total_price que por defecto solo devuelve el precio normal

        2. La Clase Hija DigitalProduct: Al heredar de Product, no necesitamos escribir nada de
            codigo dentro, Obtendra todo automaticamente

        3. La clase hija PhysicalProduct
            - Necesita su propio constructor initialize para aceptar weight
            - Usaremos la palabra clave super para decirle a Ruby "Oye pasale el nombre
                y precio al constructor de mi Padre, y yo me encargo del peso"
            - Sobreescribiremos (override) el metodo total_price para que sume
                un costo de envio basado en el peso

    PASO 2: 

    OPCION 1:


=end

# 1. CLASE PADRE
class Product
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end

    def total_price
        @price
    end
end

# 2. CLASE HIJA 1: Producto Digital
class DigitalProduct < Product 
end

# 3. CLASE HIJA 2: Producto Fisico
class PhysicalProduct < Product
    attr_reader :weight

    def initialize (name, price, weight)
        super(name, price)
        @weight = weight
    end

    # Sobreescribimos el metodo del Padre para este hijo en particular

    def total_price
        shipping_cost = @weight * 2.5
        @price + shipping_cost
    end
end

# === PRUEBA DEL CÓDIGO ===

ebook = DigitalProduct.new("Ruby Programming PDF", 20)
book = PhysicalProduct.new("Ruby Programming Hardcover", 30, 2) # 2 Kg

puts "Product: #{ebook.name} | Total: $#{ebook.total_price}"
puts "Product: #{book.name} | Total: $#{book.total_price}"


# OPCION 2:

puts "--- Shopping Cart Test ---"

# Un arreglo con diferentes tipos de productos
cart = [
  DigitalProduct.new("Rails Video Course", 100),
  PhysicalProduct.new("Mechanical Keyboard", 80, 1.5),
  DigitalProduct.new("Gift Card", 50)
]

# Podemos llamar .total_price en cada item sin importar si es digital o físico.
# Cada objeto sabe cómo calcular su propio precio. ¡Esa es la magia!
total_cart_price = cart.sum { |item| item.total_price }

puts "Cart Total (Including shipping if applicable): $#{total_cart_price}"