require_relative 'score_improver.rb'
require_relative 'course.rb'


course = Course.new
course.add(Student.new(3))
course.add(Student.new(4))
course.add(Student.new(5))
course.add(Student.new(6.2))
course.add(Student.new(5.5))
strategyMax = ImproveMax.new
course.improve(strategyMax)
course.print()

strategyMin = ImproveMin.new
course.improve(strategyMin)
course.print()