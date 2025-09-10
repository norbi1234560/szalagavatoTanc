; (function (window, angular) {

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
            controller: 'homeController',
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
            params: { class: null },
            templateUrl: './html/classes.html'
          })

          .state('event', {
            url: '/',
            parent: 'root',
            controller: 'eventController',
            templateUrl: './html/event.html'
          })

          .state('login', {
            url: '/login',
            parent: 'root',
            controller: 'loginController',
            templateUrl: './html/login.html'
          })

          .state('register', {
            url: '/register',
            parent: 'root',
            controller: 'registerController',
            templateUrl: './html/register.html'
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
      function ($scope, $http) {

        // A párok betöltése függvény
        $scope.loadPairs = () => {
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


                  for (let i = 0; i < $scope.pairs.length; i++) {
                    //Jelenlegi pár neveinek inicializálása nullra
                    let currPairName = { name1: null, name2: null };
                    for (let j = 0; j < $scope.students.length; j++) {

                      //Ha a tanuló id-ja egyenlő a pár első tagjának id-jával, akkor a tanuló nevét betesszük a currPairName Objektumba
                      if ($scope.students[j].id == $scope.pairs[i].user_id1) {
                        currPairName.name1 = $scope.students[j].name;
                      }
                      //Ha a tanuló id-ja egyenlő a pár második tagjának id-jával, akkor a tanuló nevét betesszük a currPairName Objektumba
                      if ($scope.students[j].id == $scope.pairs[i].user_id2) {
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
    .controller('homeController', [
      '$scope',
      '$http',
      '$stateParams',
      function ($scope, $http, $stateParams) {
        $scope.className = $stateParams.class;
        $scope.homeImages = [];

        $http.post("./php/getHomeImages.php", { class: $stateParams.class })
          .then(function (response) {
            $scope.homeImages = response.data.data;
            $scope.$applyAsync();
            console.log($scope.homeImages);
          })
          .catch(error => {
            console.log("Hiba.:" + error)
          })
      }
    ])
    .controller('loginController', [
      '$scope',
      '$http',
      '$stateParams',
      function ($scope, $http, $stateParams) {
      }
    ])
    .controller('registerController', [
      '$scope',
      '$http',
      '$location',
      function ($scope, $http, $location) {
        $scope.register = () => {
          $http.post("./php/register.php", { name: $scope.name, email: $scope.email, password: $scope.password })
            .then(function (response) {
              console.log(response.data);
              if (response.data.error) {
                alert("Hiba történt: " + response.data.error);
              } else {
                alert("Sikeres regisztráció!");
              }
              $scope.$applyAsync();
              $location.path('/login');
            })
            .catch(error => {
              console.log("Hiba.:" + error)
            })
          }    
      }
    ])

    .controller('classesController', [
      '$scope',
      '$http',
      '$stateParams',
      function ($scope, $http, $stateParams) {
        $scope.className = $stateParams.class;
        $http.post("./php/getStudents.php", { class: $stateParams.class })
          .then(function (response) {
            $scope.students = response.data.data;
            $scope.$applyAsync();
          })
          .catch(error => {
            console.log("Hiba.:" + error)
          })

        $scope.modalClassLoad = (radioClass) => {
          $scope.currentModalClass = radioClass;
          $http.post("./php/getStudents.php", { class: "13" + radioClass })
            .then((response) => {
              $scope.modalStudents = response.data.data;
              $http.post("./php/getBlocked.php", { user_id: $scope.currentStudent.id })
              .then((response) => {
                $scope.blockedIds = response.data.data.map(blocked => blocked.blocked_user_id);
              
                for(let i = 0; i< $scope.modalStudents.length; i++){
                  if($scope.blockedIds.includes($scope.modalStudents[i].id)){
                    $scope.modalStudents[i].blocked = true;
                  }else{
                    $scope.modalStudents[i].blocked = false;
                  }
                }
          })
              $scope.$applyAsync();
            })
            .catch((error) => {
              console.log("Hiba.:" + error);
            })
        }

        $scope.showStudentModal = (thisStudent) => {
          $scope.currentStudent = thisStudent;
        }    

        $scope.blocklistEdit = (enable, currentEditStudent, currentBlockStudent) => {
          if (enable) {
            $http.post("./php/addBlock.php", { user_id: currentEditStudent.id, blocked_user_id: currentBlockStudent.id })
              .then((response) => {
                console.log("Siker");
              })
              .catch((error) => {
                console.log("Hiba.:" + error);
              })
          }
          else {
            $http.post("./php/removeBlock.php", { user_id: currentEditStudent.id, blocked_user_id: currentBlockStudent.id })
              .then((response) => {
                console.log("Siker");
              })
              .catch((error) => {
                console.log("Hiba.:" + error);
              })
        }
    }}])

    .controller('eventController', [
      '$scope',
      '$http',
      '$stateParams',
      function ($scope, $http, $stateParams) {
        $scope.className = $stateParams.class;
        $scope.eventImages = [];

        $http.post("./php/getEventImages.php", { class: $stateParams.class })
          .then(function (response) {
            $scope.eventImages = response.data.data;
            $scope.$applyAsync();
            console.log($scope.eventImages);
          })
          .catch(error => {
            console.log("Hiba.:" + error)
          })
        $scope.currentDate = new Date();
        $scope.eventDate = new Date('2025-11-05');
        $scope.isEvent = $scope.currentDate < $scope.eventDate;
      }
    ])

})(window, angular);