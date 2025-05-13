class LiveRecordsController < ApplicationController
  def new
    @live_record = LiveRecord.new
    @artists = current_user.artists
    5.times { @live_record.songs.build } # 最初に5曲分のフォームを用意
  end

  def create
    @live_record = current_user.live_records.build(live_record_params)

    if @live_record.save
      redirect_to root_path, notice: 'ライブ記録を登録しました'
    else
      @artists = current_user.artists
      render :new, status: :unprocessable_entity
    end
  end

  private

  def live_record_params
    params.require(:live_record).permit(:artist_id, :live_title, :location, :date, :image,
      songs_attributes: [:id, :title, :track_number, :_destroy])
  end
end
