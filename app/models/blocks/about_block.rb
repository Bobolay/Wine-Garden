module Blocks
  class AboutBlock < ActiveRecord::Base
    self.table_name = :content_blocks
    acts_as_content_block

    [:image].each do |attachment_name|
      has_attached_file attachment_name
      do_not_validate_attachment_file_type attachment_name
      attr_accessible attachment_name
      allow_delete_attachment attachment_name
    end
  end
end