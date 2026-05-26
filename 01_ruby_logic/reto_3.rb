=begin

Imagina que estás construyendo la lógica para un panel de control de servicio al cliente
Recibes una lista de tickets de soporte técnico

Objetivo:
1. Revisar toda la lista de tickets
2. Encuentra únicamente los tickets que cumplan dos condiciones al mismo tiempo
que su estado sea "Abierto" y su prioridad "Alta"
3. Guarda solo el número de id de esos tickets urgentes en una nueva lista "Arreglo"
4. Imprima la lista de IDs al final

Resultado esperado [101, 105]

Necesitarás iterar el arreglo principa. Por cada ticket, deberás evaluar sus valores accediendo a ellos mediante
sus llaves. Por ejemplo tickets[:state]. Además, necesitarás usar el operador lógico AND &&

=end

# OPCION 1:

tickets = [
    {id: 101, state: "abierto", priority: "alta"},
    {id: 102, state: "cerrado", priority: "bajo"},
    {id: 103, state: "abierto", priority: "media"},
    {id: 104, state: "cerrado", priority: "alta"},
    {id: 105, state: "abierto", priority: "alta"},
]

# 1. Creamos el arreglo vacio para los resultados
ids_urgents = []

# 2. Iteramos sobre el arreglo principal
tickets.each do |ticket|

    # 3 y 4. Evaluamos multiples condiciones con el operador and &&
    # Para leer un valor dentro del hash, usamos corchetes y el simbolo ticket[:key]

    if ticket[:state] == "abierto" && ticket[:priority] == "alta"

        ids_urgents << ticket[:id]
    end
end

p ids_urgents


# OPCION 2:
# .select evalua la condicion completa. Solo deja pasar el ticket que devuelvan true
# .map toma estos tickets filtrados y extrae unicamente el valor de la llave :id

ids_urgents = tickets.select { |t| t[:state] == "abierto" && t[:priority] == "alta" }
                        .map { |t| t[:id]}
p ids_urgents