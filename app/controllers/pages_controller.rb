class PagesController < ActionController::Base
  def show
    response = params[:user_input]
    @msg = response == response.upcase ? "NOT SINCE 1983" : "SPEAK UP SONNY"
  end
end
