# frozen_string_literal: true

class SetSystemUserAsDefault < ActiveRecord::Migration[7.0]
  class UserStub < ActiveRecord::Base
    self.table_name = :users
  end

  class ArticleStub < ActiveRecord::Base
    self.table_name = :articles
  end

  class CommentStub < ActiveRecord::Base
    self.table_name = :comments
  end

  def up
    system_user = UserStub.create(email: 'system', encrypted_password: SecureRandom.hex(48))
    ArticleStub.where(user_id: nil).update_all(user_id: system_user.id)
    CommentStub.where(user_id: nil).update_all(user_id: system_user.id)
    change_column :articles, :user_id, :bigint, null: false
    change_column :comments, :user_id, :bigint, null: false
  end

  def down
    system_user = User.find_by(email: 'system')
    change_column :articles, :user_id, :bigint
    change_column :comments, :user_id, :bigint

    if system_user.present?
      ArticleStub.where(user_id: system_user.id).update_all(user_id: nil)
      CommentStub.where(user_id: system_user.id).update_all(user_id: nil)
    end

    system_user&.delete
  end
end
