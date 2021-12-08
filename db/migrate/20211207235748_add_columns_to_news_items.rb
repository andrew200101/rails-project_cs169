# frozen_string_literal: true

class AddColumnsToNewsItems < ActiveRecord::Migration[5.2]
    def change
        add_column :news_items, :issue, :string
        add_column :news_items, :rating, :integer
    end
end
