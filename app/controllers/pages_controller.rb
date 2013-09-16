class PagesController < ActionController::Base

  def show
    response = params[:user_input]
    @msg = response == response.upcase ? "NOT SINCE 1983" : "SPEAK UP SONNY"

    respond_to do |format|
      format.html { render layout: "show"}
      format.js
    end
  end
end
