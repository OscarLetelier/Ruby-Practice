Rails.application.routes.draw do
  # Esto le dice a Rails: "Cuando alguien entre a misitio.com/, 
  # mándalo al SupportTicketsController y ejecuta la acción 'index'"
  root "support_tickets#index"

  # La magia de Rails: esto genera las 7 rutas estándar del CRUD automáticamente
  resources :support_tickets
end