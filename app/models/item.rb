class Item < ActiveRecord::Base
  DAYS_TO_COMPLETE_TASK = 7
  belongs_to :user

  def due_date
    created_at + DAYS_TO_COMPLETE_TASK.days
  end


end

# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
