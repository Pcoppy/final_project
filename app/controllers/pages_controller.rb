class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_user = User.new
    @user = current_user if user_signed_in?
  end
end
