class Student
    attr_accessor :score
    def initialize(s)
        @score = s
    end

    def print()
        puts @score
    end
end

class Course
    def initialize()
        @students = []
    end
    def add(student)
        @students.push(student)
    end
    def print
        @students.each do |student|
            student.print
        end
    end
    def improve(strategy)
        strategy.improveScore(@students)
    end
end