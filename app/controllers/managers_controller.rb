class ManagersController < ApplicationController
	layout	'home_page'

	before_action :authenticate_artist!, only: [:new, :edit, :create, :update, :destroy]

	def home

	end

end
