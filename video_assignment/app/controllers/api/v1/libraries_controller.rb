class Api::V1::LibrariesController < ApplicationController


  def create
    unless library_params.blank?
      @library =Library.new(library_params)
      if @library.save
        session[:user_id] = @library.id
        render :json => {message:"Successfully created library content",data: @library,:status => 201}
      else
        render :json => {message:"Invalid entry",errors: @library.errors,:status => 401}
      end
    else
      render json: {  message: "Fill the empty fields", :status => 422  }
    end
  end

  # def update
  # end

  def show
    @library = Library.find_by_id(params[:id])
    if @library.present?
      render json: {message: "Listed entry of the library", data: @library, status: 200}
    else
      render json: {message: "No entry found with that ID", status: 422}
    end
  end

  def index
    @library = Library.all
    if @library.present?
      render json: {message: "Listed all the entries of the library", data: @library, status: 200}
    else
      render json: {message: "No entries found", status: 422}
    end
  end

  private

  def library_params
     params.require(:library).permit(:title, :youtube_url, :start_time, :end_time)
  end

end
