class TypesController < ApplicationController
  def create
    @type = Type.new(params.require(:type).permit(:name))
    if @type.save
      flash[:notice] = 'New type of expense added'
    else
      flash[:notice] = 'Its been an error'
    end
    redirect_to root_path
  end

  def update
  end

  def destroy
  end
end
