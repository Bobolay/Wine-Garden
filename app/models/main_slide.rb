class MainSlide < ActiveRecord::Base
  attr_accessible *attribute_names

  scope :published, -> { where(published: 't') }
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_attached_file :image, styles: { large: "1920x1200#", thumb: "192x120#" }

  [:image].each do |attachment_name|
    attr_accessible attachment_name
    allow_delete_attachment attachment_name
    do_not_validate_attachment_file_type attachment_name
  end

  has_cache
  def cache_instances
    [Pages.home]
  end
end
