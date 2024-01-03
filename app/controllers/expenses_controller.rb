class ExpensesController < ApplicationController
  def create
    p params[:expense][:type_id]
    p Type.find(params[:expense][:type_id]).name

    @expense = Expense.new(params.require(:expense).permit(:cost, :type_id))
    if @expense.save
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
