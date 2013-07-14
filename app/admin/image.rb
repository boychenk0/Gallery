ActiveAdmin.register Image do
  index do
      selectable_column
      column :id
      column "View" do |img|
        image_tag(img.url, :size => '128x128')
      end
      column :url
      column :likes_count
      column :comments_count
      column :created_at
      column :updated_at
      default_actions
  end

  controller do
    def index
      params[:order] = 'likes_count_desc'
      super
    end
  end
end

#form do |f|
  #  f.semantic_errors :base
  #  f.inputs "Project Details" do
  #    f.input :name
  #    f.input :description, as: :html_editor
  #    f.input :since
  #    f.input :till
  #    f.input :team_size
  #    f.input :url
  #    f.input :technologies, :as => :check_boxes
  #    f.input :services, :as => :check_boxes
  #    f.has_many :upload_files do |file|
  #      file.input :filename, :as => :file, :label => 'Image', :hint => file.template.image_tag(file.object.filename.url, :height => 200, :width => 200)
  #      file.input :id, :as => :hidden
  #    end
  #  end
  #  f.actions
  #
  #end
 #  def create
 #    @project = Project.new(project_params)
 #    if @project.save
 #      redirect_to admin_project_url(@project), notice: 'Project was successfully created.'
 #    else
 #      render :new
 #    end
 #  end
 #  def update
 #    @project = Project.find(params[:id])
 #    if @project.update(project_params)
 #      redirect_to edit_admin_project_url(@project), notice: 'Project was successfully updated.'
 #    else
 #      render :edit
 #    end
 #  end
 #  private
 #  def project_params
 #    params.require(:project).permit(:name, :description, :since, :till, :team_size, :url, upload_files_attributes: [:filename, :id])
 #  end