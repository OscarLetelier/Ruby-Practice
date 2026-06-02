class SupportTicketsController < ApplicationController
  def index

    @tickets = SupportTicket.all
  end
end
