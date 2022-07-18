# frozen_string_literal: true

class RemoveCommenterColumnFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :commenter, :string
  end
end
