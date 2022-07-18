# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.bigint :article_id, null: false
      t.bigint :tag_id, null: false

      t.timestamps
    end
  end
end
