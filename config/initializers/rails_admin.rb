RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    nestable do
      only [Dish]
    end
  end

  config.included_models = []
<<<<<<< HEAD
  config.include_models Pages::Home, Cms::MetaTags, FormConfigs::OrderRequest, OrderRequest, Dish, InteriorComponent
=======
  config.include_models Pages::Home, Cms::MetaTags, FormConfigs::OrderRequest, OrderRequest, User
>>>>>>> 13f2c1bfffb2d3627a6afca0898b9595a2874509

  Cms.configure_rails_admin(config)

  config.model Pages::Home do
    field :seo_tags
  end

  config.model OrderRequest do
    field :persons_quantity
    field :name
    field :phone
    field :date_time

    field :created_at
    field :referer
    field :session_id
  end

  config.model FormConfigs::OrderRequest do
    field :email_receivers do
      label "Отримувачі"
      help "Кожен емейл з нового рядка"
    end
  end

  config.model Dish do
    nestable_list({position_field: :sorting_position})

    edit do
      field :name
      field :label
      field :image
      field :description
      field :price
      field :weight
    end
  end

  config.model InteriorComponent do
    nestable_list({position_field: :sorting_position})

    edit do
      field :name
      field :label
      field :image
      field :description
    end
  end

  config.model User do 
    field :email
    field :password
    field :password_confirmation
  end
end
