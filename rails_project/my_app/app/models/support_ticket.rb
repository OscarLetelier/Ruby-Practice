class SupportTicket < ApplicationRecord
  # Valida que el campo no esté vacío (nil o strings en blanco)
  validates :customer_name, presence: true
  
  # Podemos encadenar validaciones. Aquí exigimos que exista y tenga al menos 10 caracteres
  validates :issue_description, presence: true, length: { minimum: 10 }
  
  # Validamos que el estado solo pueda ser uno de estos tres valores permitidos
  validates :status, inclusion: { in: %w[Open Pending Closed], message: "%{value} is not a valid status" }
end