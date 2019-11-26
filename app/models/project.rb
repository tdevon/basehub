class Project < ApplicationRecord
    belongs_to :user
    has_many :tasks, :dependent => :delete_all 
    accepts_nested_attributes_for :tasks, :reject_if => proc { |attributes| attributes['name'].blank? }
end
