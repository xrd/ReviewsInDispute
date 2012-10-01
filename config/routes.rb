Reviews::Application.routes.draw do
  match "reviews/vote" => "reviews#vote"
end
