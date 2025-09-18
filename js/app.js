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
                templateUrl: './html/header.html'
              },
              'footer@root': {
                templateUrl: './html/footer.html'
              },
              'modal@root': {
                templateUrl: './html/modal.html'
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
            url: '/reserve',
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
            url: '/event',
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

          .state('profile', {
            url: '/profile',
            parent: 'root',
            controller: 'profileController',
            templateUrl: './html/profile.html'
          })

          .state('gallery', {
            url: '/gallery',
            parent: 'root',
            controller: 'galleryController',
            templateUrl: './html/gallery.html'
          })

        $urlRouterProvider.otherwise('/');
      }
    ])

    // Application run
    .run([
      '$rootScope',
      '$location',
      ($rootScope, $location) => {

        // user object
        $rootScope.user = {};
        console.log($rootScope.user);

        $rootScope.checkedUser = JSON.parse(localStorage.getItem('user')) || 0;
        if ($rootScope.checkedUser != 0) {
          $rootScope.user = JSON.parse(localStorage.getItem('user'));
          $rootScope.loggedIn = true;
        }

        //user object
        $rootScope.loginUser = function (data, message) {
          $rootScope.user.id = data.id;
          $rootScope.user.name = data.name;
          localStorage.setItem('user', JSON.stringify($rootScope.user));
          $rootScope.loggedIn = true;
          $rootScope.message = message;
        }

        $rootScope.logOut = function () {
          $rootScope.message = "Biztos ki szeretnél jelentkezni?"
          $rootScope.loggedOut = true;
          $rootScope.confirmLogOut = () => {
            $rootScope.message = "Sikeres kijelentkezés viszlát";
            $rootScope.loggedOut = false;
            localStorage.removeItem('user');
            setTimeout(function () {
              window.location.reload();
            }, 700);
            $location.path("/home");

          }

        }
      }
    ])

    // Reserve controller
    .controller('reserveController', [
      '$scope',
      '$rootScope',
      '$http',
      function ($scope, $rootScope, $http) {

        // A párok betöltése függvény
        $scope.loadPairs = () => {

          //Változók
          $scope.students = [];

          //Tanulók lekérése
          $http.post("./php/getAllStudents.php")
            .then((studentResponse) => {

              //Tanulók tömbjének adatot adunk az adatbázisból
              $scope.students = studentResponse.data.data;

              //Párok lekérése
              $http.post("./php/getPairs.php")
                .then((pairResponse) => {
                  $scope.loadablePairs = pairResponse.data.data;
                  console.log($scope.loadablePairs);
                  $scope.pairsNamed = [];
                  for (let i = 0; i < $scope.loadablePairs.length; i++) {
                    for (let j = 0; j < $scope.students.length; j++) {
                      if ($scope.loadablePairs[i].user_id1 == $scope.students[j].id) {
                        $scope.user1_name = $scope.students[j].name;
                        $scope.user1_gender = $scope.students[j].gender;
                        $scope.user1_image = $scope.students[j].class + "/" + $scope.students[j].image;
                      }
                      if ($scope.loadablePairs[i].user_id2 == $scope.students[j].id) {
                        $scope.user2_name = $scope.students[j].name;
                        $scope.user2_gender = $scope.students[j].gender;
                        $scope.user2_image = $scope.students[j].class + "/" + $scope.students[j].image;
                      }
                    }
                    $scope.pairsNamed.push({
                      name1: $scope.user1_name,
                      name2: $scope.user2_name,
                      gender1: $scope.user1_gender,
                      gender2: $scope.user2_gender,
                      image1: $scope.user1_image,
                      image2: $scope.user2_image
                    });
                  }
                  console.log($scope.pairsNamed);
                })
                .catch((error) => {
                  console.error("hiba az adat betöltésénél: ", error);
                });

            }, (error) => {
              console.error("hiba az adat betöltésénél: ", error);
            });
        }

        $scope.makePairs = () => {

          $scope.allStudents = []
          $http.post("./php/removePairs.php")
            .then(() => {
              console.log("Régi párok törölve");
              $http.post("./php/getAllStudents.php")
                .then((response) => {
                  $scope.allStudents = response.data.data;
                })
                .then(() => {
                  $http.post("./php/getBlocklist.php")
                    .then((blockListResponse) => {
                      $scope.blockListData = blockListResponse.data.data;

                      for (let i = 0; i < $scope.allStudents.length; i++) {
                        let student = $scope.allStudents[i];

                        student.pairList = $scope.allStudents.filter(
                          x =>
                            x !== student
                            && !x.taken
                            && !$scope.blockListData.some(
                              y => (y.user_id === student.id && y.blocked_user_id === x.id)
                                || (y.user_id === x.id && y.blocked_user_id === student.id)
                            )
                        );
                        if (student.gender == "F") {
                          student.pairList = student.pairList.filter(x =>
                            x.gender == "M"
                          );
                        } else {
                          student.pairList = student.pairList.filter(x =>
                            x.gender == "F"
                          );
                        }

                      }

                      $scope.pairs = [];

                      for (let student of $scope.allStudents) {
                        if (student.pairList.length === 0) continue;

                        $scope.allStudents.forEach(e => {
                          let index = e.pairList.findIndex(x => x === student);
                          if (index !== -1) e.pairList.splice(index, 1)
                        });

                        if (student.taken || student.taken === 1) continue;

                        let pair = student.pairList[Math.floor(Math.random() * student.pairList.length)];

                        student.pair = pair;
                        pair.pair = student;

                        student.taken = true;
                        pair.taken = true;

                        $scope.pairs.push([student, pair]);


                        $scope.allStudents.forEach(e => {
                          let index = e.pairList.findIndex(x => x === pair);
                          if (index !== -1) e.pairList.splice(index, 1);
                        });
                      }
                      $http.post("./php/addPairs.php", $scope.pairs.map(([a, b]) => [a.id, b.id]))
                        .then((response) => {
                          console.log("Sikeres párosítás adatbázisba mentés");
                          $scope.loadPairs();
                        })
                        .catch((error) => {
                          console.log("Hiba a párosítás adatbázisba mentésénél: ", error);
                        });
                    })
                    .catch((error) => {
                      console.log(error);
                    })
                })
                .catch((error) => {
                  console.log(error);
                })

            })
            .catch((error) => {
              console.log("Hiba a régi párok törlésénél: ", error);
            })
        }
        $scope.loadPairs();
      }
    ])

    .controller('profileController', [
      '$scope',
      '$http',
      '$rootScope',
      '$location',
      function ($scope, $http, $rootScope, $location) {

        $scope.modify = () => {
          $http.post("./php/editUser.php", {
            email: $scope.model.email,
            password: $scope.model.password
          })
            .then(function (response) {
              console.log(response.data);

              $rootScope.msg = "Sikeres megváltoztatás" + $scope.name + "!";

              $rootScope.loginUser(response.data.data, $rootScope.msg);
              $scope.$applyAsync();
              $location.path('/');


            })
            .catch(error => {
              $rootScope.message = "Hiba történt: " + error;
              console.log($scope.Error)
            })

        }
      }
    ])

    // Home controller
    .controller('homeController', [
      '$scope',
      '$http',
      function ($scope, $http) {
        $scope.homeImages = [];

        $http.post("./php/getGallery.php", { class: "home" })
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

    .controller('galleryController', [
      '$scope',
      'http',
      '$rootScope',
      '$location',
      function ($scope, http, $rootScope, $location) {
        $scope.galleryImages = [];

        http.request({ url: './php/getGallery.php' })
          .then(function (response) {
            // Ellenőrizd, hogy a képek hol vannak a válaszban
            if (Array.isArray(response)) {
              $scope.galleryImages = response;
            } else if (response && response.data) {
              $scope.galleryImages = response.data;
            } else {
              $scope.galleryImages = [];
            }
            $scope.$applyAsync();
            console.log($scope.galleryImages);
          })
          .catch(error => {
            console.log("Hiba.:" + error);
          });
      }
    ])

    // Login controller
    .controller('loginController', [
      '$scope',
      'http',
      '$rootScope',
      '$location',
      function ($scope, http, $rootScope, $location) {
        $scope.login = () => {
          http.request({
            url: './php/login.php',
            data: {
              email: $scope.email_login,
              password: $scope.password_login
            }
          })
            .then(function (response) {
              $rootScope.msg = "Sikeres bejelentkezés, üdvözlünk " +
                response.data.name + "!";
              $rootScope.loginUser(response.data,
                $rootScope.msg);
              $scope.$applyAsync();
              $location.path('/');
            })
            .catch(error => {
              $rootScope.message = "Hiba történt: " + error;
              $scope.$applyAsync();
            })
        }

        $scope.register = () => {
          http.request({
            url: "./php/register.php",
            data: {
              name: $scope.name,
              email: $scope.email_register,
              password: $scope.password_register
            }
          })
            .then(function (response) {
              console.log(response.data);

              $rootScope.msg = "Sikeres regisztráció, üdvözlünk " + $scope.name + "!";

              $rootScope.loginUser(response.data.data, $rootScope.msg);
              $scope.$applyAsync();
              $location.path('/');


            })
            .catch(error => {
              $rootScope.message = "Hiba történt: " + error;
              console.log($scope.Error)
            })

        }
      }
    ])

    // Register controller
    .controller('registerController', [
      '$scope',
      '$http',
      '$location',
      '$rootScope',
      function ($scope, $http, $location, $rootScope) {

      }
    ])

    // Classes controller
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
        $http.post("./php/getClasses.php")
          .then(function (response) {
            $scope.classes = response.data.data.map(c => c.class);
            $scope.classes.sort();
            $scope.$applyAsync();

            console.log($scope.classes);
          })
          .catch(error => {
            console.log("Hiba: " + error);
          });


        $scope.modalClassLoad = (radioClass) => {
          $scope.currentModalClass = radioClass;
          $http.post("./php/getStudents.php", { class: "13" + radioClass })
            .then((response) => {
              $scope.modalStudents = response.data.data;
              $http.post("./php/getBlocked.php", { user_id: $scope.currentStudent.id })
                .then((response) => {

                  if (response.data.data != null) {
                    $scope.blockedIds = response.data.data.map(blocked => blocked.blocked_user_id);

                    for (let i = 0; i < $scope.modalStudents.length; i++) {
                      if ($scope.blockedIds.includes($scope.modalStudents[i].id)) {
                        $scope.modalStudents[i].blocked = true;
                      } else {
                        $scope.modalStudents[i].blocked = false;
                      }
                    }

                  } else {
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
        }
      }])

    // Event conroller
    .controller('eventController', [
      '$scope',
      '$http',
      function ($scope, $http) {
        $scope.eventImages = [];

        $http.post("./php/getGallery.php", { class: "event" })
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