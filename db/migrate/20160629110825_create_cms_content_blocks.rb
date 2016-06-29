class CreateCmsContentBlocks < ActiveRecord::Migration
  def up
    Cms.create_tables only: [:content_blocks]
  end

  def down
    Cms.drop_tables only: [:content_blocks]
  end
end
