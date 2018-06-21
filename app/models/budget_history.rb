class BudgetHistory < ApplicationRecord
  has_many :budget_histories, :dependent => :nullify
  has_one :service, :dependent => :nullify
end