class BusinessCard < ApplicationRecord
    validates :name, presence: true
    validates :company_name, presence: true
end
