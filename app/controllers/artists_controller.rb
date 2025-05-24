class ArtistsController < ApplicationController
before_action :authenticate_user!

  def index
    @artists = current_user.artists
  end

  def new
    @artist = current_user.artists.build
  end

  def create
    @artist = current_user.artists.build(artist_params)
    if @artist.save
      redirect_to @artist, notice: "アーティストを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @artist = current_user.artists.find(params[:id])
    spotify_artist = RSpotify::Artist.search(@artist.name).first
    @spotify_artist_id = spotify_artist&.id
  end

  def edit
    @artist = current_user.artists.find(params[:id])
  end

  def update
    @artist = current_user.artists.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist, notice: "アーティスト情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artist = current_user.artists.find(params[:id])
    @artist.destroy
    redirect_to artists_path, notice: "アーティストを削除しました。"
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
