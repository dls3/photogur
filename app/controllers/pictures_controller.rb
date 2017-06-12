class PicturesController < ApplicationController

  def index
    # @pictures = Picture.all(params[:id])
    @most_recent_pictures = Picture.most_recent_five
    @older_than_month_pictures = Picture.created_before(Time.utc(2017, "jun", 07, 20, 01, 01))
    @pictures_from_year = Picture.pictures_year(2017)
  end

  def self.pictures_year(year)
    Picture.where("created_at LIKE ?", year.to_s + '%')
  end


  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def picture_params
    { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    # use the same picture_params method that we used in create
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

end
