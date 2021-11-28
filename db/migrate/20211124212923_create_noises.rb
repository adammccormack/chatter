# frozen_string_literal: true

class CreateNoises < ActiveRecord::Migration[6.1]
  def change
    create_table :noises do |t|
      t.bigint :user_id
      t.text :content

      t.timestamps
    end
  end
end
