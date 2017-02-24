class ContactsController < ApplicationController
  def create
    @customer = current_user
    @yacht = Yacht.find(params[:yacht_id])
    @owner = @yacht.user
    ContactMailer.email_owner(@customer, @yacht, params[:message], @owner).deliver
    redirect_to root_path
  end
end
