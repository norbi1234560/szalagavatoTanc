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
      '$location',
      ($rootScope,$location) => {

        // get year
        $rootScope.currentDate = new Date();
        $rootScope.currentYear = $rootScope.currentDate.getFullYear();

        // user object
        $rootScope.user = {};
        console.log($rootScope.user);

        $rootScope.checkedUser = JSON.parse(localStorage.getItem('user'))||0;
        if($rootScope.checkedUser != 0){
          $rootScope.user = JSON.parse(localStorage.getItem('user'));
          $rootScope.loggedIn = true;
        }

        //user object
        $rootScope.loginUser = function(data) {
          $rootScope.user.id = data.id;
          $rootScope.user.name = data.name;
          localStorage.setItem('user', JSON.stringify($rootScope.user));
          $rootScope.loggedIn = true;
          alert("Üdvözlünk "+ $rootScope.user.name + "!"); 
        }
        $rootScope.logOut = function(){
          if(confirm("Biztos ki szeretnél lépni?")){
            alert("Viszlát " + $rootScope.user.name + "!")
            localStorage.removeItem('user');
            setTimeout(function(){
              window.location.reload();
            },20);
            $location.path("/home");
          }
          else{
            alert("Bejelentkezve maradtál!");
          } 
        }
      }
    ])

    .controller('reserveController', [
      '$scope',
      '$rootScope',
      '$http',
      function ($scope,$rootScope,$http) {

        // A párok betöltése függvény
        $scope.loadPairs = () => {
          
          //Változók
          $scope.students = [];

          //Tanulók lekérése
          $http.post("./php/getStudents.php")
          .then((studentResponse) => {

            //Tanulók tömbjének adatot adunk az adatbázisból
            $scope.students = studentResponse.data.data;

          },(error) => {
            console.error("hiba az adat betöltésénél: ", error);
          });
        }

        $scope.makePairs = () => {

          $scope.allStudents = []

          $http.post("./php/getAllStudents.php")
          .then((response) => {
            $scope.allStudents = response.data.data;
          })
          .catch((error) => {
            console.log(error);
          })

          $http.post("./php/getBlocklist.php")
          .then((blockListResponse) => {
            $scope.blockListData = blockListResponse.data.data;

            for (let i = 0; i < $scope.allStudents.length; i++) {
              console.log($scope.blockListData[i]);

              for (let j = 0; j < $scope.blockListData.length; j++) {
                if ($scope.allStudents[i]["blocked_user_id"] == $scope.blockListData[j]["id"]) {
                  // console.log("SZIA LAJOS");
                }  
              }
            }
          })
          .catch((error) => {
            console.log(error);
          })
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
      '$rootScope',
      '$location',
      function ($scope, $http, $rootScope, $location) {
        $scope.login = () => {
          $http.post("./php/login.php", {email: $scope.email, password: $scope.password })
            .then(function (response) {
              console.log(response.data);
              if (response.data.error) {
                alert("Hiba történt: " + response.data.error);
              } else {
                alert("Sikeres bejelentkezés!");
              }
              $rootScope.loginUser(response.data.data);
              $scope.$applyAsync();
              $location.path('/home');
            })
            .catch(error => {
              console.log("Hiba.:" + error)
            })
        }    
      }
    ])

    .controller('registerController', [
      '$scope',
      '$http',
      '$location',
      '$rootScope',
      function ($scope, $http, $location, $rootScope) {
        $scope.register = () => {
          $http.post("./php/register.php", { name: $scope.name, email: $scope.email, password: $scope.password })
            .then(function (response) {
              console.log(response.data);
              if (response.data.error) {
                alert("Hiba történt: " + response.data.error);
              } else {
                alert("Sikeres regisztráció!");
              }
              $rootScope.loginUser(response.data.data);
              $scope.$applyAsync();
              $location.path('/');
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

                if(response.data.data != null){
                  $scope.blockedIds = response.data.data.map(blocked => blocked.blocked_user_id);
                  
                  for(let i = 0; i< $scope.modalStudents.length; i++){
                    if($scope.blockedIds.includes($scope.modalStudents[i].id)){
                      $scope.modalStudents[i].blocked = true;
                    }else{
                      $scope.modalStudents[i].blocked = false;
                    }
                  }

                }else{
                  console.log("Nincs tiltott személy!")
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