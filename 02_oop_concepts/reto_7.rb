=begin

Imagina que tu plataforma ahora vende tanto productos fisicos (PhysicalItem) como servicios
de consultoria freelance (FreelanceService). Ambas cosas son muy distintas (un servicio se cobra por hora
a un precio fijo), por lo que no deber[ian heredar del mismo padre. Sin embargo, ambos deben pagar impuestos
Tax

OBJETIVO
    1. Crear un moudlo Taxable que contenga la logica matematica par acalcular el impuesto
        asumiento un 19% o 0.19
    2. Crea la clas PhysicalItem
    3. Crea la clase FreelanceService (Cuyo precio total se calcula multiplicano tarifa por horas)
    4. Inyectar el modulo en ambas clases para que puedan calcular su precio con impuestos sin duplicar codigo


    PASO 1: La lofica (Seudocodigo)
        1. El modulo Tazable: Sera un bloque de codigo independiente con metodos como calculate_tax y price_with_tax. Este
            modulo asumira que, donde sea que lo inyectemos, existira u metodo llamado price.
        2. Las clases: Definimeros los constructores initialize de ambas clases
        3. La inyeccion: Usaremos la palabra clave include NombreDelModulo dentro de las clases. Esto toma todos los metodos
        del modulo y los pega invisiblemente dentro de la clase.


    OPCION 1:

=end

#  1, Definimos el modulo la habilidad de ser Gravable o sujeto a impuesto
module Taxable
    def calculate_tax
        price * 0.19
    end

    def price_with_tax
        price + calculate_tax
    end
end

# 2. Clase 1 Un articulo fisico
class PhysicalItem
    include Taxable

    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end
end

# 3. Clase 2: Un servicio freelance no tiene nada que ver con un PhysicalItem
class FreelanceService
    include Taxable

    attr_reader :service_name, :hourly_rate, :hours

    def initialize(service_name, hourly_rate, hours)
        @service_name = service_name
        @hourly_rate = hourly_rate
        @hours = hours
    end

    def price
        @hourly_rate * @hours
    end
end

# === PRUEBA DEL CODIGO ===

monitor = PhysicalItem.new("Monitor 4K", 300)
consulting = FreelanceService.new("Ruby Mentorship", 50, 4) # $50/hr por 4 horas = $200

puts "--- Tax Report ---"
puts "Item: #{monitor.name}"
puts "Base: $#{monitor.price} | Tax: $#{monitor.calculate_tax} | Total: $#{monitor.price_with_tax}"

puts "------------------"
puts "Service: #{consulting.service_name}"
puts "Base: $#{consulting.price} | Tax: $#{consulting.calculate_tax} | Total: $#{consulting.price_with_tax}"


