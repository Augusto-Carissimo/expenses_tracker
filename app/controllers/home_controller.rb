class HomeController < ApplicationController
  def index
    @total_expenses = total_expenses
    @monthly_expenses = monthly_expenses
    @last_expense = Expense.last
  end

  def show
  end

  def update
  end

  def delete
  end

  private

  def all_type_expenses
    @all_type_expenses ||= Type.all
  end

  def total_expenses
    total_expense = all_type_expenses.sum(&:total_expense)
    expense = {}
    all_type_expenses.map { |type| expense[type.name] = ((type.total_expense / total_expense) * 100).round(2) } if total_expense > 0

    expense
  end

  def monthly_expenses
    total_monthy_expense = all_type_expenses.sum(&:month_expense)
    expense = {}
    all_type_expenses.map { |type| expense[type.name] = ((type.month_expense / total_monthy_expense)*100).round(2) } if total_monthy_expense > 0

    expense
  end
end
