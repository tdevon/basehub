class Task < ApplicationRecord
    belongs_to :project
    set_sortable :sort
end
