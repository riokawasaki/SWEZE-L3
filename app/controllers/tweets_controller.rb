class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    
    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
        if @tweet.save
            flash[:notice] = 'ツイートしました'
            redirect_to '/'
        else
            render 'new', status: :unprocessable_entity
        end
    end
    
    def destroy
        @tweet = Tweet.find(params[:id])
        if @tweet.destroy
            flash[:notice] = 'ツイートを削除しました'
        else
            flash[:alert] = 'ツイートを削除できませんでした'
        end
        redirect_to '/'
    end
    
    def show
        @tweet = Tweet.find(params[:id])
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(message: params[:tweet][:message], tdate: Time.current)
            flash[:notice] = 'ツイートを更新しました'
            redirect_to '/'
        else
            render 'edit', status: :unprocessable_entity
        end
    end
end
