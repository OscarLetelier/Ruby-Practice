class SupportTicketsController < ApplicationController
  before_action :set_ticket, only: [:edit, :update, :destroy]

  def index
    @tickets = SupportTicket.all
  end

  def new
    @ticket = SupportTicket.new
  end

  def create
    @ticket = SupportTicket.new(ticket_params)

    if @ticket.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ticket
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def set_ticket
    @ticket = SupportTicket.find(params[:id])
  end

  def ticket_params
    params.require(:support_ticket).permit(:customer_name, :issue_description, :status)
  end
end