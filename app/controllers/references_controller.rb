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
end
