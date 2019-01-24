# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :Enrollment



end
