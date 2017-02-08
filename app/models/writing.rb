class Writing < ApplicationRecord

   before_save :falsify_all_others, if: :front_page?


private
  def falsify_all_others
    Writing.where('id != ?', self.id).update_all(front_page: false)
  end
end
