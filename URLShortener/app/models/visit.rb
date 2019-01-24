class Visit < ApplicationRecord

  validates :user_id, presence: true
  validates :short_url, presnce: true




  def record_visit!(user, shortened_url)
    
  end

end
