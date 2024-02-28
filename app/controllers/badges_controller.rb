class BadgesController < ApplicationController

  def index
    @badges = current_user.badges
  end

  # def badges_user
  #   @badges = current_user.badges
  # end

end
