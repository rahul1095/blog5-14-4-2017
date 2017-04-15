class AddDocumentToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :document, :string
  end
end
