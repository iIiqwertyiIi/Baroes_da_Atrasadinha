class WatchlistController < ApplicationController
  def create
    @cria = Watchlist.new(params.require(:watchlist).permit(:user_id, :movie_id))
    begin
      @cria.save!
      flash[:notice] ='Filme adicionado aos assistidos'
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to movie_path(params[:watchlist][:movie_id])
    end
  end

  def destroy
    @amendoborto = Watchlist.find(params[:id])
    begin
      @amendoborto.destroy!
      flash[:notice] = 'Filme removido dos assistidos'
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to movies_path
    end
    end
end

