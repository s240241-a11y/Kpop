class TweetsController < ApplicationController
  def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @tweets = Tweet.joins(:user).where("kpop LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
      else
        @tweets = Tweet.all
      end
  end

 def BTS
    @tweets = Tweet.all
  end

  def TWICE
    @tweets = Tweet.all
  end

  def IVE
    @tweets = Tweet.all
  end
 
  def aespa
    @tweets= Tweet.all
  end

  def BABYMONSTER
    @tweets = Tweet.all
  end

  def BOYNEXTDOOR
    @tweets = Tweet.all
  end

  def new
     @tweet = Tweet.new
  end

  def create
     tweet = Tweet.new(tweet_params)

     tweet.user_id = current_user.id

    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
  end
end
 
def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end
  
   def edit
    @tweet = Tweet.find(params[:id])
  end

   def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

private
  
  def tweet_params
    params.require(:tweet).permit(:content, :kpop_group, :image, :category)
  end
end
