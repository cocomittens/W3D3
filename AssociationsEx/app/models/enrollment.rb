# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint(8)        not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
  validates :course_id, presence: true
  validates :student_id, presence: true 

  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

    def course({})
      return options.class_name.("Wherer id = options.foreign_key")    
    end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User


end
