class InsertDishes < ActiveRecord::Migration
  def up
    [{name: "салат &#171;цезар&#187;", label: "Хіт сезону", price: 110, published: 't',
      description: "Ніжна куриця, свіже листя салату та апетитний сир під класичним соусом подарують Вам ні з чим незрівнянний смак улюбленого салату.",
      weight: 215, image_source: "main/dish1.jpg"
     },
     {name: "паста з лососем", label: "Пропозиція тижня", price: 120, published: 't',
      description: "Справжня італійська паста з ніжним смаком лосося – спробуйте незвичайне поєднання звичних продуктів та відчуйте неймовірний смак цієї дивовижної страви.",
      weight: 300, image_source: "main/dish2.jpg"
     },
     {name: "форель", label: "Страва від шефа", price: 40, published: 't',
      description: "Соковита королівська рибка, яка тане в роті. Смачно, корисно і вишукано! Чудовим доповненням до страви стане біле вино.",
      weight: 100,
      image_source: "main/dish3.jpg"
     },
     {name: "плов", label: "Краща пропозиція", price: 55, published: 't',
      description: "Соковите м’ясо, розсипчастий рис, свіжа морква та неймовірні аромати спецій – ось він, ідеальний плов!",
      weight: 260,
      image_source: "main/dish4.jpg"
     },
     { name: "гарбузовий крем-суп", label: "Страва від шефа", price: 55, published: 't',
      description: "Ніжна консистенція, дивовижний аромат та м’який смак поживного супу придадуть енергії та здоров’я Вам та Вашій родині!",
      weight: 250, image_source: "main/dish5.jpg"
     }
    ].each do |hash|
      image_source = hash.delete(:image_source)
      record = Dish.new(hash)
      record.image = File.open(Rails.root.join("app/assets/images/#{image_source}"))
      record.save
    end
  end
end
