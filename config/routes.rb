Reviews::Application.routes.draw do
  match "reviews/vote" => "reviews#vote"
  match "reviews/summary" => "reviews#summary"
end
