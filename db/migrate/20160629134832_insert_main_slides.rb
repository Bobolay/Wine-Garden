class InsertMainSlides < ActiveRecord::Migration
  def up
    [{ published: 't', image_source: "main/banner-1.jpg",
     },
     {published: 't', image_source: "main/banner-2.jpg",
     },
     { published: 't', image_source: "main/banner-3.jpg",
     }
    ].each do |hash|
      image_source = hash.delete(:image_source)
      record = MainSlide.new(hash)
      record.image = File.open(Rails.root.join("app/assets/images/#{image_source}"))
      record.save
    end
  end
end
