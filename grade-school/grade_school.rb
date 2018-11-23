class School
  def initialize
    @subscriptions = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade)
    @subscriptions[grade] << name
  end

  def students(grade)
    @subscriptions[grade].sort
  end

  def students_by_grade
    result = @subscriptions.map do |grade, students|
      { grade: grade, students: students.sort }
    end

    result.sort_by { |hash| hash[:grade] }
  end
end
