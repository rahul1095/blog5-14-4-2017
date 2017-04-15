class AddVedioToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :vedio, :string
  end
end
