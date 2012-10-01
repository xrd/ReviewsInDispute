class ReviewsController < ApplicationController
  def vote
    Vote.create ip: request.ip, choice: params[:choice] if params[:choice]
    render json: { percentages:
      { truthy: Vote.where('choice=?', 'truthy').count,
        falsy: Vote.where('choice=?', 'falsy' ).count } }
    
  end
end
