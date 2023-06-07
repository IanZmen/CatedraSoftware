class ImproveStrategy
    def improveScore(students)
        raise NotImplementedError
    end
    def incrementBy(diff, students)
        students.each do |student|
            student.score = min.call(student.score + diff, 7)
        end
    end
    def specificScore(specificFunction, initialValue, students)
        specificScore = initialValue
        students.each do |student|
            specificScore = specificFunction.call(specificScore, student.score)
        end
        specificScore
    end
end

def min()
    lambda {|a, b| a<b ? a : b}
end
def max()
    lambda {|a, b| a>b ? a : b}
end

class ImproveMax < ImproveStrategy
    def improveScore(students)
        maxScore = specificScore(max(), 1, students)
        incrementBy(7 - maxScore, students)
    end
end

class ImproveMin < ImproveStrategy
    def improveScore(students)
        minScore = specificScore(min(), 7, students)
        incrementBy(4 - minScore, students)
    end
end