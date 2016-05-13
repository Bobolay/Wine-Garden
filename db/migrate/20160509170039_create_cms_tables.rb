class CreateCmsTables < ActiveRecord::Migration
  def up
    Cms.create_tables(only: [:form_configs, :pages, :seo_tags])
  end

  def down
    Cms.drop_tables(only: [:form_configs, :pages, :seo_tags])
  end
end
