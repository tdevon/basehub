class CalendarController < ApplicationController
    def index
        @projects = current_user.projects.all
        @dates = []
        @projects.each do |project|
            project.tasks.each do |task|
                @dates.push(task)
            end
        end
        @dates.sort!
    end
end
