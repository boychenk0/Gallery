ActiveAdmin.register Category do

  index do
    column :id
    column :name
    column :images_count
    column :created_at
    default_actions
  end

  controller do
    cache_sweeper :category_sweeper, :only => [:create, :update, :destroy]

    def create
      super
    end

    def update
      super
    end

    def destroy
      super
    end
  end

end