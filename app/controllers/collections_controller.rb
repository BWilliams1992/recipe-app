class CollectionsController < ApplicationController
  before_action :find_collection, only:[:show, :edit, :update, :destroy ]
  before_action :authenticate_user!
  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id 
    if @collection.save
      flash[:notice] = "Collection was succesfully created!"
      redirect_to @collection
    else
      render 'new'
    end
  end

  def show
    authorize! :read, Collection, message: "Can only view own collections!"
  end
  
  def index 
    @collections = current_user.collections
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      flash[:notice] = "Collection successfully updated!"
      redirect_to @collection
    else
      render 'edit'
    end
  end

  def destroy
    @collection.destroy
    flash[:notice] = "Collection deleted"
    redirect_to collections_path
  end

  private

    def collection_params
      params.require(:collection).permit(:title, :description)
    end

    def find_collection
      @collection = Collection.find(params[:id])
    end

end
