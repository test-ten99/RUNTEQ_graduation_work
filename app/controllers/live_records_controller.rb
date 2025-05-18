class LiveRecordsController < ApplicationController
  def index
    @live_records = current_user.live_records.includes(:artist).order(date: :desc)
  end

  def new
    @live_record = LiveRecord.new
    @artists = current_user.artists
    5.times { @live_record.songs.build } # 最初に5曲分のフォームを用意
  end

  def create
  @live_record = current_user.live_records.build(live_record_params)

    # 入力された順に track_number を自動で付与
    @live_record.songs.each_with_index do |song, index|
      song.track_number = index + 1
    end

    if @live_record.save
      redirect_to @live_record, notice: "ライブ記録を登録しました。"
    else
      @artists = current_user.artists  # エラー時に再描画のため
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @live_record = LiveRecord.find(params[:id])
  end

  def edit
    @live_record = current_user.live_records.find(params[:id])
    @artists = current_user.artists
  end

  def update
    @live_record = current_user.live_records.find(params[:id])
    if @live_record.update(live_record_params)
      redirect_to @live_record, notice: "ライブ記録を更新しました。"
    else
      @artists = current_user.artists
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @live_record = current_user.live_records.find(params[:id])
    @live_record.destroy
    redirect_to mypage_path, notice: "ライブ記録を削除しました。"
  end

  private

  def live_record_params
    params.require(:live_record).permit(:artist_id, :live_title, :location, :date, :image, songs_attributes: [ :id, :title, :track_number, :_destroy ])
  end
end
