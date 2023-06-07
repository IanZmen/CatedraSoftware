class Student
    attr_accessor :score
    def initialize(s)
        @score = s
    end
end

def min (a,b)
    a<b ? a : b
end

class Course
    def initialize()
        @students = []
        @students.push(Student.new(3))
        @students.push(Student.new(4))
        @students.push(Student.new(5))
        @students.push(Student.new(6.2))
        @students.push(Student.new(5.5))
    end
    def print
        @students.each do |student|
            puts student.score
        end
    end
    def improveScoresMax()
        maxScore = 1
        @students.each do |student|
            if  maxScore < student.score
                maxScore = student.score
            end
        end
        diff = 7 - maxScore
        @students.each do |student|
            student.score = min(student.score + diff,7)
        end
    end
    def improveScoresMin()
        minScore = 7
        @students.each do |student|
            if  minScore > student.score
                minScore = student.score
            end
        end
        diff = 4 - minScore
        @students.each do |student|
            student.score = min(student.score + diff,7)
        end
    end
end