BASE_URL = 'http://reviews.vivooh.com'

mod = angular.module 'reviews', [ 'ngResource', 'ngCookies' ]
mod.factory 'Review', [ '$resource', ($resource) ->
        $resource "#{BASE_URL}/reviews/:id/:action", {alt: 'json', callback: 'JSON_CALLBACK'},
                vote: { method: 'JSONP', params: { action: 'vote' } },
                summary: { method: 'JSONP', params: { action: 'summary' } }
        ]

COOKIE_KEY = 'myVoteAirbnbInterpretation'

class ReviewCtrl
        constructor: ($scope, Review, $cookieStore) ->

                $scope.skipVoting = () ->
                        Review.summary {}, (response) ->
                                $scope.vote = true
                                $scope.percentages = response.percentages

                $scope.vote = $cookieStore.get COOKIE_KEY
                $scope.skipVoting() if $scope.vote

                option1 =
                        description: "There is not a washer and dryer on site. The listing indicated that there was a washer and dryer on site. The listing was untruthful.",
                        tag: 'falsy'
                option2 =
                        description: "There is not a washer and dryer on site. The listing did not indicate that there was a washer and dryer on site. The listing was truthful.",
                        tag: 'truthy'

                $scope.options = []
                $scope.options.push option1
                $scope.options.push option2
                # Make the choices appear in different order to really make sure no one is motivated more by laziness
                $scope.options = $scope.options.reverse() if Math.random() > 0.5


                $scope.doVote = (choice) ->
                        unless $scope.vote
                                $scope.voting = true
                                Review.vote { choice: choice.tag }, (response) ->
                                        $scope.vote = choice.tag
                                        $scope.voted = true
                                        $scope.voting = false
                                        $scope.percentages = response.percentages
                                        $cookieStore.put( COOKIE_KEY, $scope.vote )
                        else
                                console.log "You already voted..."


ReviewCtrl.$inject = [ '$scope', 'Review', '$cookieStore' ]
@ReviewCtrl = ReviewCtrl