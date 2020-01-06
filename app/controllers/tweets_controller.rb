class TweetsController < ApplicationController

  def index
    @tweets=Tweet.all
  end

  def new
    @tweet=Tweet.new
  end

  def confirm
  end

  def edit
  end

  def show
  end
end
