class SupportTicketsController < ApplicationController
  def index
    @tickets = SupportTicket.all
  end

  # 1. Acción NEW: Prepara un "molde" vacío para el formulario
  def new
    @ticket = SupportTicket.new
  end

  # 2. Acción CREATE: Recibe los datos del botón "Submit" y los guarda
  def create
    @ticket = SupportTicket.new(ticket_params)

    if @ticket.save
      # Si se guarda en PostgreSQL, redireccionamos a la página principal
      redirect_to root_path
    else
      # Si hay un error, volvemos a mostrar la vista "new" con los datos que ya había escrito
      render :new, status: :unprocessable_entity
    end
  end

  # 3. Accion EDIT: Busca el ticket en la DB para llenar el formulario
  def edit
    @ticket = SupportTicket.find(params[:id])
  end

  # 4. Accion UPDATE: Procesa los cambios enviados por el usuario
  def update
    @ticket = SupportTicket.find(params[:id])

    # En lugar de .new, usamos .update pasando nuestros Strong Parameters
    if @ticket.update(ticket_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # STRONG PARAMETERS: El filtro de seguridad de la aduana
  def ticket_params
    params.require(:support_ticket).permit(:customer_name, :issue_description, :status)
  end
end