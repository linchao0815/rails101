class WelcomeController < ApplicationController
	def index
		#flash[:notice]= "good morning!"
		#flash[:alert]= "good night!"
		flash[:warning]= "This is waring!"
	end
end
