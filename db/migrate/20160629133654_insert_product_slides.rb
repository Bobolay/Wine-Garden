class InsertProductSlides < ActiveRecord::Migration
  def up
    [{ published: 't', image_source: "main/wine1.jpg", name: "червоне сухе", product_model_name: "&#171;valpolicella&#187; (італія)", year: 2012,
     },
     {published: 't', image_source: "main/wine2.jpg", name: "червоне сухе", product_model_name: "&#171;valpolicella&#187; (італія)", year: 2012
     },
     { published: 't', image_source: "main/wine3.jpg", name: "біле сухе", product_model_name: "&#171;lozano&#187; (іспанія)", year: 2015
     },
     { published: 't', image_source: "main/wine4.jpg", name: "біле сухе", product_model_name: "&#171;pinot grigio&#187; (італія)", year: 2014,
     },
     { published: 't', image_source: "main/wine5.jpg", name: "біле сухе", product_model_name: "&#171;sauvignon blanc&#187; (чилі)", year: 2014,
     },
     { published: 't', image_source: "main/wine6.jpg", name: "біле десертне марочне", product_model_name: "&#171;троянда карпат&#187; (україна)", year: 2015,
     },
     { published: 't', image_source: "main/wine7.jpg", name: "червоне напівсолодке", product_model_name: "&#171;alazani valley&#187; (грузія)", year: 2010,
     },
    ].each do |hash|
      image_source = hash.delete(:image_source)
      record = ProductSlide.new(hash)
      record.image = File.open(Rails.root.join("app/assets/images/#{image_source}"))
      record.save
    end
  end
end
