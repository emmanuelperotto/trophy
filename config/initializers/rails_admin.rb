# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

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

  config.actions do
    dashboard do
      except ['KilledMonster', 'KilledMonsters']
    end
    index
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
  end

  config.excluded_models = ['ActiveStorage::Attachment', 'ActiveStorage::Blob']

  config.model 'Monster' do
    list do
      exclude_fields :killed_monsters, :users
    end

    show do
      exclude_fields :users, :killed_monsters
    end

    edit do
      exclude_fields :users, :killed_monsters
    end

    create do
      exclude_fields :users, :killed_monsters
    end
  end

  config.model 'Reward' do
    config.label_methods << :description

    list do
      exclude_fields :reward_users
    end

    show do
      exclude_fields :reward_users
    end

    edit do
      exclude_fields :image, :reward_users, :users
    end

    create do
      exclude_fields :image, :reward_users, :users
    end
  end

  config.model 'User' do
    config.label_methods << :email

    list do
      field :id
      field :email
      field :total_coins
      field :deaths_count
      field :killed_bowsers_count
      field :killed_turtles_count
      field :killed_monsters_count
      field :created_at
      field :updated_at
    end

    show do
      field :email
      field :total_coins
      field :deaths_count
      field :killed_bowsers_count
      field :killed_turtles_count
      field :killed_monsters_count
      field :rewards
    end

    edit do
      field :email
      field :password
      field :password_confirmation
    end

    create do
      field :email
      field :password
      field :password_confirmation
    end
  end
end
