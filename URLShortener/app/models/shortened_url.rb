# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true
  validates :long_url, presence: true
  validates :short_url, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code(long_url)
    url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?({short_url: url})
      url = SecureRandom.urlsafe_base64
    end
    url
  end

  def self.create!(user, long_url)
    short_url = self.random_code(long_url)
    self.new({user_id: user.id, short_url: short_url, long_url:long_url}).save
   
  end

  # ShortenedUrl.create!({long_url, user_id})



end
