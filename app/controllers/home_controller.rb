class HomeController < ApplicationController
  def index
    @total_expenses = total_expenses
    @monthly_expenses = monthly_expenses
  end

  def show
  end

  def update
  end

  def delete
  end

  private

  def total_expenses
    total_expense = Type.all.map(&:total_expense).sum
    expense = {}
    Type.all.each do |type|
      expense[type.name] = ((type.total_expense / total_expense)*100).round(2)
    end
    expense
  end

  def monthly_expenses
    total_monthy_expense = Type.all.map(&:month_expense).sum
    expense = {}
    Type.all.each do |type|
      expense[type.name] = ((type.month_expense / total_monthy_expense)*100).round(2)
    end
    expense
  end
end
