class Video < ApplicationRecord

  validates :title, presence: true
  validates :url, presence: true

  before_save :falsify_all_others, if: :front_page?


private
  def falsify_all_others
    Video.where('id != ?', self.id).update_all(front_page: false)
  end

  # def front_page?
  #   self.front_page
  # end 

end
