# frozen_string_literal: true

class AddUserIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :integer
  end
end
