Rails.application.routes.draw do
  # Esto le dice a Rails: "Cuando alguien entre a misitio.com/, 
  # mándalo al SupportTicketsController y ejecuta la acción 'index'"
  root "support_tickets#index"

  # La ruta que generó nuestro comando anteriormente:
  get "support_tickets/index"
end