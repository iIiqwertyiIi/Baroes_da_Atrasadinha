# frozen_string_literal: true

class AddUserBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :biography, :text
  end
end
