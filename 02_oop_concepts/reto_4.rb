=begin
Crea una clase CunetaBancaria que permita

1. Crea una cuenta nueva asignandole un nombre de titular y un saldo inicial
2. Hacer un deposito (Sumar dinero al saldo)
3. Hacer un retiro (Restar dinero, pero validando que haya saldo suficiente)
4. Ver el saldo actual

PASO 1: Seudocodigo
    1. Atributo: El estado cada cuenta necesita recordar quien es su dueño (titular) y cuanto dinero tiene 
    (saldo). En Ruby, estas varaibles que viven dentro del objeto se llaman variables de instancia y se escriben
    con un @ al principio ejemplo @saldo

    2. Constructor: Es el metodo especial que se ejecuta automaticamente cuando construimos una nueva cuenta
    En Ruby siempre se llama initialize

    3. Comportamiento (metodos): Funciones que viviran dentro de la clase (depositar, retirar) 
    que modificara la variable @saldo

=end

#OPCIÓN 1:

class BankAcount
    #1. El constructor: Se ejecuta al hacer BackAcount.new
    def initialize(holder, balance_initial)
        @holder = holder
        @balance = balance_initial
    end

    #2. Metodo para leer el saldo (Getter Manual)
    def check_balance
        "El saldo Actual #{@holder} es $#{@balance}"
    end

    #3. Metodo para depositar
    def deposit(amount)
        @balance = @balance + amount
        puts "Deposito de $#{amount} exitoso."
    end

    #4. Metodo para retirar con validacion logica
    def withdraw(amount)
        if amount > @balance
            puts "Error: Fondos insuficientes para retirar &#{amount}"
        else
            @balance = @balance - amount
            puts "Retiro de $#{amount} exitoso"
        end
    end
end


# === PRUEBA DE NUESTRA CLASE ===
my_account = BankAcount.new("Oscar", 1000)
puts my_account.check_balance
my_account.deposit(500)
my_account.withdraw(2000)
my_account.withdraw(300)
puts my_account.check_balance

#OPCIÓN 2:
class BackAcount
    #attr_reader crea automaticamente un metodo leer @holder y @balance sin tener que programarlo
    attr_reader :holder, :balance

    def initialize(holder, balance_initial = 0) # Podemos dar un valor por defecto al saldo
        @holder = holder
        @balance = balance_initial
    end

    def deposit(amount)
        # += es la forma corta de escribir @saldo = @saldo + cantidad
        @balance += amount
        puts "Deposito exitoso. Nuevo saldo $#{balance}"
    end

    def withdraw(amount)
        # Guard clause (Clausula de guarda): en Ruby es comun retornar temprano si hay un error, para no anidar codigo.
        return puts "Error: Fondos insuficientes." if amount > @balance

        @balance -= amount
        puts "Retiro exitoso. Nuevo Saldo: $#{balance}"
    end
end

# === PRUEBA ===
my_account = BackAcount.new("Oscar", 1000)
my_account.deposit(500)
my_account.withdraw(200)

# Gracias a attr_reader, ahora podemos preguntar por el holder o saldo directamente de la siguiente forma:
puts "Resumen final: #{my_account.holder} tiene $#{my_account.balance}"
