class ImproveStrategy
    def improveScore(students)
        raise NotImplementedError
    end
    def incrementBy(diff, students)
        students.each do |student|
            student.score = min(student.score + diff, 7)
        end
    end
end

def min (a,b)
    a<b ? a : b
end

def max (a,b)
    a>b ? a : b
end

class ImproveMax < ImproveStrategy
    def improveScore(students)
        max = maxScore(students)
        incrementBy(7 - max, students)
    end

    def maxScore(students)
        maxScore = 1
        students.each do |student|
            maxScore = max(maxScore, student.score)
        end
        maxScore
    end
end

class ImproveMin < ImproveStrategy
    def improveScore(students)
        min = minScore(students)
        incrementBy(4 - min, students)
    end

    def minScore(students)
        minScore = 7
        students.each do |student|
            minScore = min(minScore, student.score)
        end
        minScore
    end
end