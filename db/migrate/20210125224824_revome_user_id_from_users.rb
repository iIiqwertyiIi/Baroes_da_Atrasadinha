# frozen_string_literal: true

class RevomeUserIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_id, :integer
  end
end
