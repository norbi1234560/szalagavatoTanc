;(function(window, angular) {

  'use strict';

  // Application module
  angular.module('app', [
    'ui.router',
		'app.common'
  ])

  // Application config
  .config([
    '$stateProvider', 
    '$urlRouterProvider', 
    ($stateProvider, $urlRouterProvider) => {

      $stateProvider
      .state('root', {
				abstract: true,
				views: {
					'@': {
						templateUrl: './html/root.html'
					},
					'header_nav@root': {
						templateUrl: './html/header_nav.html'
					},
					'footer@root': {
						templateUrl: './html/footer.html'
					}
				}
      })
			.state('home', {
				url: '/',
				parent: 'root',
				templateUrl: './html/home.html',
        controller: 'homeController',
			})
      .state('reserve', {
				url: '/reserve',
				parent: 'root',
				templateUrl: './html/reserve.html',
        controller: 'reserveController',
			})
      .state('event', {
				url: '/event',
				parent: 'root',
				templateUrl: './html/event.html',
        controller: 'eventController',
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

  // Application run
  .run([
    'trans',
    (trans) => {

      // Transaction events
			trans.events();
    }
  ])

  .controller('homeController', [
      '$scope',
      '$http',
      '$rootScope',
      function ($scope, $http, $rootScope){
        console.log("homecontroller")
      }
    ])
    .controller('reserveController', [
      '$scope',
      '$http',
      '$rootScope',
      function ($scope, $http, $rootScope){
        console.log("reservecontroller")
      }
    ])
    .controller('eventController', [
      '$scope',
      '$http',
      '$rootScope',
      function ($scope, $http, $rootScope){
        console.log("eventcontroller")
      }
    ])

})(window, angular);