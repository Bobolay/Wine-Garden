class InsertInteriorSlides < ActiveRecord::Migration
  def up
    [{ published: 't', image_source: "interior_slides/1.jpg",
     },
     {published: 't', image_source: "interior_slides/2.jpg",
     },
     { published: 't', image_source: "interior_slides/3.jpg",
     }
    ].each do |hash|
      image_source = hash.delete(:image_source)
      record = InteriorSlide.new(hash)
      record.image = File.open(Rails.root.join("app/assets/images/#{image_source}"))
      record.save
    end
  end
end
