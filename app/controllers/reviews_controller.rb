class ReviewsController < ApplicationController

  def summary
    render json: { percentages:
      { truthy: Vote.where('choice=?', 'truthy').count,
        falsy: Vote.where('choice=?', 'falsy' ).count, total: Vote.count } },
    callback: params[:callback]
  end
  
  def vote
    Vote.create ip: request.ip, choice: params[:choice] if params[:choice]
    summary()
  end
end
