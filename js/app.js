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
						templateUrl: './html/footer.html',
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
    '$rootScope',
    (trans, $rootScope) => {

      // get year
      $rootScope.currentDate = new Date();
      $rootScope.currentYear = $rootScope.currentDate.getFullYear();

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
      console.log($rootScope.user);
      $http.get("./php/get_data.php")
      .then(function (response) {
        $scope.students = response.data.records;
      }, function (error) {
        console.error("hiba az adat betöltésénél: ", error);
        $scope.students = [];
      });
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