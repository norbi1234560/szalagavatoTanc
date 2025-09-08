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
					'footer@root': {
						templateUrl: './html/footer.html'
					}
				}
      })
			.state('home', {
				url: '/',
				parent: 'root',
        controller:'reserveController',
				templateUrl: './html/reserve.html'
			})
      
      $urlRouterProvider.otherwise('/');
    }
  ])

  // Application run
  .run([
    '$rootScope',
    ($rootScope) => {

      // get year
      $rootScope.currentDate = new Date();
      $rootScope.currentYear = $rootScope.currentDate.getFullYear();
    }
  ])

  .controller('reserveController', [
    '$scope',
    '$http',
    function ($scope, $http){

      $scope.openBlockList = function(student){

        let blockStudentID = prompt("Kérem adja meg annak a diáknak az id-ját, akit szeretne a tiltott listára felírni!");
        if(blockStudentID == null || blockStudentID === ''){
          alert("NEm változtattál a listán!");
          return;
        }
        else if(isNaN(Number(blockStudentID))){
          alert("Számot kell megadni!!");
          return;
        }
        else if(blockStudentID< 0 || blockStudentID >= $scope.students.length){

          alert("Az adott listából kell sorszámot választani!");
          return;
        }
        else if(Number(blockStudentID) === student){

          alert("Saját magát nem lehet választani!");
          return;
        }

        $scope.students[student-1].blockList.push($scope.students[blockStudentID].name);

        $http.post("./php/changeBlocklist.php", {user_id: student, blocked_user_id: blockStudentID})
              .then(function(response){
                alert(response.data.data);
              }, function (error) {
                  alert(error);
              })}

      $http.get("./php/getStudents.php")
      .then(function (response) {

        $scope.students = response.data.data;
        for(let i = 0; i< $scope.students.length ; i++){
          $scope.students[i].blockList = [];
        }

      }, function (error) {

        console.error("hiba az adat betöltésénél: ", error);
        $scope.students = [];
      });

       $http.get("./php/getBlocklist.php")
      .then(function (response) {

        $scope.blockList = response.data.data;

      }, function (error) {

        console.error("hiba az adat betöltésénél: ", error);
        $scope.students = [];
      });

       $http.get("./php/getPairs.php")
      .then(function (response) {

        $scope.pairs = response.data.data;

      }, function (error) {

        console.error("hiba az adat betöltésénél: ", error);
        $scope.students = [];
      });
    }
  ])

})(window, angular);