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
          'header@root': {
            templateUrl: './html/header.html',
          },
					'footer@root': {
						templateUrl: './html/footer.html'
					}
				}
      })
			.state('home', {
				url: '/',
				parent: 'root',
        // controller: 'homeController',
				templateUrl: './html/home.html'
			})

      .state('reserve', {
        url: '/',
        parent: 'root',
        controller: 'reserveController',
        templateUrl: './html/reserve.html'
      })
      

      .state('classes', {
        url: '/classes/:class',
        parent: 'root',
        controller: 'classesController',
        params: {class: null},
        templateUrl: './html/classes.html'
      })

      .state('event', {
        url: '/',
        parent: 'root',
        controller: 'eventController',
        templateUrl: './html/event.html'
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

      $scope.students = [];
      $http.post("./php/getStudents.php", {class: null})
      .then(function (response) {

        $scope.students = response.data.data;
        for(let i = 0; i< $scope.students.length ; i++){
          $scope.students[i].blockList = [];
        }

      }, function (error) {

        console.error("hiba az adat betöltésénél: ", error);
        $scope.students = [];
      });

      $scope.openBlockList = function(student){

        let blockStudentID = prompt("Kérem adja meg annak a diáknak az id-ját, akit szeretne a tiltott listára felírni!");
        if(blockStudentID == null || blockStudentID === ''){
          alert("Nem változtattál a listán!");
          return;
        }
        else if(isNaN(Number(blockStudentID))){
          alert("Számot kell megadni!!");
          return;
        }
        else if(blockStudentID< 0 || blockStudentID >= $scope.students.length+1){

          alert("Az adott listából kell sorszámot választani!");
          return;
        }
        else if(Number(blockStudentID) === student-1){

          alert("Saját magát nem lehet választani!");
          return;
        }

        $scope.students[student-1].blockList.push($scope.students[blockStudentID].name);

        $http.post("./php/block.php", {user_id: student, blocked_user_id: blockStudentID})
              .then(function(response){
                alert(response.data.data);
              }, function (error) {
                  alert(error);
              })}


       $http.get("./php/getBlocklist.php")
      .then(function (response) {

        $scope.blockList = response.data.data;

      }, function (error) {

        console.error("hiba az adat betöltésénél: ", error);
        $scope.students = [];
      });

      // A párok betöltése függvény
      $scope.loadPairs = () =>  {
        //Változók
        $scope.students = [];
        $scope.pairs = [];
        $scope.pairsNamed = [];

        //Tanulók lekérése
        $http.get("./php/getStudents.php")
          .then(function (studentResponse) {

            //Tanulók tömbjének adatot adunk az adatbázisból
            $scope.students = studentResponse.data.data;

            //Párok lekérése
            $http.get("./php/getPairs.php")
              .then(function (pairResponse) {

                //Párok tömbjének adatot adunk az adatbázisból
                $scope.pairs = pairResponse.data.data;


                for(let i = 0; i < $scope.pairs.length; i++){
                  //Jelenlegi pár neveinek inicializálása nullra
                  let currPairName = {name1: null, name2: null};
                  for(let j = 0; j < $scope.students.length; j++){

                    //Ha a tanuló id-ja egyenlő a pár első tagjának id-jával, akkor a tanuló nevét betesszük a currPairName Objektumba
                    if($scope.students[j].id == $scope.pairs[i].user_id1){
                      currPairName.name1 = $scope.students[j].name;
                    }
                    //Ha a tanuló id-ja egyenlő a pár második tagjának id-jával, akkor a tanuló nevét betesszük a currPairName Objektumba
                    if($scope.students[j].id == $scope.pairs[i].user_id2){
                      currPairName.name2 = $scope.students[j].name;
                    }
                  }
                  //A jelenlegi pár neveit betesszük a párokat tároló tömbbe
                  $scope.pairsNamed.push(currPairName);
                }
              }, function (error) {
                console.error("hiba az adat betöltésénél: ", error);
              });
          }, function (error) {
            console.error("hiba az adat betöltésénél: ", error);
          });
      }
      $scope.loadPairs();
    }
  ])

  .controller('classesController', [
    '$scope',
    '$http',
    '$stateParams',
    function($scope,$http,$stateParams){
      $scope.className = $stateParams.class;
      $http.post("./php/getStudents.php",{class: $stateParams.class})
        .then(function(response){
          $scope.students = response.data.data;
          $scope.$applyAsync();
        })
        .catch(error => {
          console.log("Hiba.:" + error)
        })
    }
  ])

  .controller('eventController', [
    '$scope',
    '$http',
    function ($scope, $http){}
  ])

  .controller('homeController', [])

})(window, angular);