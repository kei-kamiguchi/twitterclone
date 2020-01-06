class TweetsController < ApplicationController
  before_action :common_action, only:[:edit, :update, :show, :destroy]

  def index
    @tweets=Tweet.all
  end

  def new
    @tweet=Tweet.new
  end

  def create
    @tweet=Tweet.new(tweet_params)
    if params[:back].present?
      render :new
      return
    end

    if @tweet.save
      redirect_to tweets_path, notice: "ツイートが作成されました"
    else
      render :new
    end
  end


  def confirm
    @tweet=Tweet.new(tweet_params)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートを編集しました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'ツイートを削除しました'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def common_action
    @tweet=Tweet.find(params[:id])
  end

end
