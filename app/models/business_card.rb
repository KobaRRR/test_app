class BusinessCard < ApplicationRecord
    validates :name, presence: true
end
