class ContactsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@con = current_user.id
  	@contacts = Contact.where(user_id: @con)
  end
  def new
  	@contact = Contact.new
  end
  def create
  	
  	@contact = Contact.new(params.require(:contact).permit(:name, :phone , :address , :user_id))
  	@contact.user_id = current_user.id

  	if @contact.save
  	flash[:success] = "Contact Saved Successfully....!"
  	redirect_to new_contact_path
  	
  else
  	flash[:error] = "Contact Not Saved...!"
  	render 'new'
  end
  	end
  	def show
  		
  		@contact = Contact.find(params[:id])		
  		
  	end
  	
  	def edit
  		@contact = Contact.find(params[:id])
  	end

  	def update
  		@contact = Contact.find(params[:id])
  		if @contact.update(params.require(:contact).permit(:name,:phone,:address))
  		redirect_to @contact	
  			
  		else
  			render 'edit'
  			
  		end
  	end
  	def destroy
  		@contact = Contact.find(params[:id])
  		@contact.destroy
  		redirect_to contacts_path
  		
  	end

end
