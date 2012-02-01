class AddAttachmentToDevotions < ActiveRecord::Migration
  def change
    add_column :devotions, :attachment_file_name, :string
    add_column :devotions, :attachment_file_size, :integer
    add_column :devotions, :attachment_content_type, :string
    add_column :devotions, :attachment_updated_at, :datetime
  end
end
