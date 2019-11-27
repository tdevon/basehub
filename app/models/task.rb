class Task < ApplicationRecord
    belongs_to :project
    before_save :default_values
    def default_values
        self.date ||= DateTime.now
    end
    def start_time
        self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
end
