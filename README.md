This shows how to embed a little bit of AngularJS into a Wordpress blog.

You can see this live here: http://www.webiphany.com/2012/10/01/when-did-airbn…ating-its-wife

WARNING: Wordpress will strip your ng-* tags if you toggle between HTML and Visual mode, so stay in HTML mode!!!

To use it:

* Add the JS to the top of the Wordpress post
* Setup a rails server with this repo
* Configure the resource route in app/assets/javascripts/review.js.coffee by changing the BASE_URL variable
* Customize the options inside the controller

In other words, copy this into Wordpress:

    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular-resource.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.2/angular-cookies.min.js"></script>
    <script type="text/javascript" src="//reviews.myhost.com/assets/review.js"></script>
    <div ng-controller="ReviewCtrl" ng-app="reviews">
    
    Talk about something before voting...
    
    Your choices:
    <button ng-click="doVote(option)" ng-repeat="option in options">{{option.description}}</button>
    
    <div ng-show="vote">
    Now you've voted!
    
    <strong>
    {{(percentages.truthy/percentages.total)*100|number:0}}% voted for the truthy choice. 
    {{(percentages.falsy/percentages.total)*100|number:0}}% chose the falsy item.
    </strong>
    
    </div>
    
    </div>
    