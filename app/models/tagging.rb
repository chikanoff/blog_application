# == Schema Information
#
# Table name: taggings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  tag_id     :bigint           not null
#
class Tagging < ApplicationRecord
    belongs_to :tag
    belongs_to :article
end
