# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :board_tag_relations, dependent: :delete_all #destoryメソットで消すとき
  has_many :boards, through: :board_tag_relations #一つのタグが複数の掲示板を持つ、throughはboard_tag_relationsを関連付けてboardと関連付ける
end
