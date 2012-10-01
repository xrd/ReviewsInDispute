mod = angular.module 'reviews', [ 'ngResource', 'ngCookies' ]
mod.factory 'Review', [ '$resource', ($resource) ->
        $resource 'http://reviews.vivooh.com/reviews/:id/:action', {},
                vote: { method: 'JSONP', params: { action: 'vote' } }
        ]

class ReviewCtrl
        constructor: ($scope, Review, $cookieStore) ->

                $scope.voted = $cookieStore.get('voted')

                option1 =
                        description: "There is not a washer and dryer on site. The listing indicated that there was a washer and dryer on site.",
                        tag: 'falsy'
                option2 =
                        description: "There is not a washer and dryer on site. The listing did not indicate that there was a washer and dryer on site.",
                        tag: 'truthy'

                $scope.options = []
                $scope.options.push option1
                $scope.options.push option2
                $scope.options = $scope.options.reverse() if Math.random() > 0.5

                $scope.vote = (choice) ->
                        unless $scope.voted
                                $scope.voting = true
                                Review.vote { choice: choice.tag }, (response) ->
                                        $scope.voted = true
                                        $scope.voting = false
                                        $scope.percentages = response.percentages
                                        $cookieStore.put('voted', true )
                        else
                                console.log "You already voted..."



@ReviewCtrl = ReviewCtrl