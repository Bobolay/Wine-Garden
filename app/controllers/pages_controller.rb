class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  self.layout "home"

  caches_page :index

  def index
     set_page_metadata(:home)

      @main_slides = MainSlide.published.sort_by_sorting_position
      @interior_slides = InteriorSlide.published.sort_by_sorting_position
      @product_slides = ProductSlide.published.sort_by_sorting_position

      @dishes = Dish.published.sort_by_sorting_position
      @interior_components = InteriorComponent.published.sort_by_sorting_position
  end

  private

  def set_page_instance
     #set_page_metadata(action_name)
  end
end