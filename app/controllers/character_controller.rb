class CharacterController < ApplicationController

	get "/users/:user_slug/:game_slug/characters" do
 		if logged_in?
 			@logged_in = logged_in?
 			@user_profile = User.find_by_slug(params[:user_slug])
			@game = Game.find_by_slug(params[:game_slug])
			@user = current_user
			@characters = @user_profile.characters.select { |character| character.game_id == @game.id}

			erb :"/characters/characters"
		else
			redirect to "/"	
		end
	end


	get  "/users/:user_slug/:game_slug/characters/:character_slug" do
		if logged_in?
 			@logged_in = logged_in?
 			@user_profile = User.find_by_slug(params[:user_slug])
			@game = Game.find_by_slug(params[:game_slug])
			@user = current_user
			@character = Character.find_by_slug(params[:character_slug])

			erb :"/characters/show_character"
		else
			redirect to "/"	
		end
	end
end