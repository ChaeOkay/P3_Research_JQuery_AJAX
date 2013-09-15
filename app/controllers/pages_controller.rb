class PagesController < ActionController::Base
  def index
    @grandma = params[:grandma]
  end

  def grandma
    @response = params[:user_input]
    @msg = @response == @response.upcase ? "NOT SINCE 1983" : "SPEAK UP SONNY"
  end
end
