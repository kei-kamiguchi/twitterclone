class TweetsController < ApplicationController

  def index
    @tweets=Tweet.all
  end

  def new
    @tweet=Tweet.new
  end

  def create
    @tweet=Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートが作成されました"
    else
      render :new
    end
  end


  def confirm
  end

  def edit
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:context)
  end

end
