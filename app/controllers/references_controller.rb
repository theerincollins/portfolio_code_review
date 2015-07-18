class ReferencesController < ApplicationController

  def index
    @references = Reference.all
    respond_to do |format|
      format.html {redirect_to references_path}
      format.js
    end
  end

  def show
    @references = Reference.all
  end

  def new
    @reference = Reference.new
    @references = Reference.all
  end

  def create
    @references = Reference.all
    @reference = Reference.new(reference_params)
    if @reference.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      flash[:alert] = "Hmm, looks like something went wrong."
      render :new
    end
  end


  private
  def reference_params
    params.require(:reference).permit(:name, :email, :testimonial, :phone_number)
  end
end
