class InviteRequestsController < ApplicationController

	layout 'invite_pages'

	def new
	 @contact = Contact.new
	end

	def user_invite
	 @contact = Contact.new
	end


	def select
		
	end
end
