ActiveAdmin.register ImgComment do
  index do
    selectable_column
    column :id
    column :body
    column :created_at
    column :updated_at
    column 'image' do |com|
      link_to "to imageFIXME!!!"
      #image_tag(com.image, :size => '128x128')
    end
    default_actions
  end
  controller do
    def index
      params[:order] = 'created_at_desc'
      super
    end
  end
end