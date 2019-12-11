RailsAdmin.config do |config|

  ### Popular gems integration
  config.parent_controller = "::ApplicationController"
  ## == Devise ==
  config.authenticate_with do
    unless current_user && current_user.admin?
      redirect_to(
        main_app.root_path,
        alert: "You are not admin, you are not permitted to view this page"
      )
    end
  end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.excluded_models = ["Like", "Rating", "FollowAuthor", "FollowBook", "Comment"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["RequestBorrow"]
    end
    export
    bulk_delete
    show
    edit do
      except ["User"]
    end
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model "Book" do
    edit do
      field :category
      field :author
      field :publisher
      field :name
      field :content, :ck_editor
      field :quanity
      field :picture, :active_storage
    end
  end
end
