class Budget < ApplicationRecord
  has_many :budget_histories, :dependent => :nullify
end