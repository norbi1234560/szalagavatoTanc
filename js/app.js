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
      'util',
      ($rootScope,$location,util) => {

        // user object
        $rootScope.user = {};
        $rootScope.loggedIn = false;
        console.log($rootScope.user);

        //get PageID
        let PageId = util.getPageId();

        //get localStorage.getItem('user')
        $rootScope.checkedUser = JSON.parse(localStorage.getItem('user'))||0;

        if(typeof $rootScope.checkedUser.pageID != "undefined"){
          if($rootScope.checkedUser != 0 && $rootScope.checkedUser.pageID.includes("szalagavatotanc")){
            $rootScope.user = JSON.parse(localStorage.getItem('user'));
            $rootScope.loggedIn = true;
          }
        }
        
        //user object
        $rootScope.loginUser = function (data, message) {
          $rootScope.user.id = data.id;
          $rootScope.user.name = data.name;
          $rootScope.user.pageID = PageId;
          localStorage.setItem('user', JSON.stringify($rootScope.user));
          $rootScope.loggedIn = true;
          $rootScope.message = message;
        }

        $rootScope.logOut = function () {
          $rootScope.message = "Biztos ki szeretne jelentkezni?"
          $rootScope.loggedOut = true;
          $rootScope.confirmLogOut = () => {
            $rootScope.message = "Sikeresen kijelentkezett a fiókjából!";
            $rootScope.loggedOut = false;
            localStorage.removeItem('user');
            setTimeout(function () {
              window.location.reload();
            }, 700);
            $location.path("/home");

          }

        }

        //get languages
        $rootScope.getLanguages = function() {
          fetch('./php/getLanguages.php')
          .then(res => res.json())
          .then(res => {
            if (res.error) {
              console.error(res.error);
            }
            else {

              //set language data
              $rootScope.languages = res.data;
              
              for (let lang of $rootScope.languages) {
                lang.data = JSON.parse(lang.data);
              }
              
              //set default to hu
              $rootScope.currentLang = $rootScope.languages[3].data;

              $rootScope.$applyAsync();
            }
          })
          .catch(err => console.error(err));
        }

        //run
        $rootScope.getLanguages();
      }
    ])

    // Reserve controller
    .controller('reserveController', [
      '$scope',
      '$http',
      function ($scope, $http) {


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
                  if (!pairResponse.data.error) {
                    $scope.loadablePairs = pairResponse.data.data;
                    console.log($scope.loadablePairs);
                    $scope.pairsNamed = [];
                    for (let i = 0; i < $scope.loadablePairs.length; i++) {
                      for (let j = 0; j < $scope.students.length; j++) {

                        if ($scope.loadablePairs[i].user_id1 == $scope.students[j].id) {
                          let studentEdit = $scope.students[j].name;
                          let ekezet = "áéíöüúűőó";
                          let ekezetNelkul = "aeiouuuoo";

                          studentEdit = $scope.students[j].name.replaceAll(" ", "_").replace().toLowerCase();

                          for(let k=0; k< ekezet.length; k++){
                            studentEdit = studentEdit.replaceAll(ekezet[k], ekezetNelkul[k]);
                          }
                          $scope.$applyAsync();

                          $scope.user1_name = $scope.students[j].name;
                          $scope.user1_gender = $scope.students[j].gender;
                          $scope.user1_image = $scope.students[j].class + "/" + studentEdit + "/" + studentEdit +".jpg";
                        }
                        if ($scope.loadablePairs[i].user_id2 == $scope.students[j].id) {
                          let studentEdit = $scope.students[j].name;
                          let ekezet = "áéíöüúűőó";
                          let ekezetNelkul = "aeiouuuoo";

                          studentEdit = $scope.students[j].name.replaceAll(" ", "_").replace().toLowerCase();

                          for(let k=0; k< ekezet.length; k++){
                            studentEdit = studentEdit.replaceAll(ekezet[k], ekezetNelkul[k]);
                          }
                          $scope.$applyAsync();
                          
                          $scope.user2_name = $scope.students[j].name;
                          $scope.user2_gender = $scope.students[j].gender;
                          $scope.user2_image = $scope.students[j].class + "/" + studentEdit + "/" + studentEdit +".jpg";
                        }
                      }
                      $scope.pairsNamed.push({
                        name1: $scope.user1_name,
                        name2: $scope.user2_name,
                        gender1: $scope.user1_gender,
                        gender2: $scope.user2_gender,
                        image1: $scope.user1_image,
                        image2: $scope.user2_image,
                      })

                    }
                    console.log($scope.pairsNamed);
                  } else {
                    console.error(pairResponse.data.error);
                  }
                })
                .catch((error) => {
                  console.error("Hiba az adat betöltése során: ", error);
                });

            }, (error) => {
              console.error("Hiba az adat betöltése során: ", error);
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
                  console.log($scope.allStudents);
                  $scope.allStudents = $scope.allStudents.sort(x => x.gender == "F" ? 1 : -1);
                  console.log($scope.allStudents);
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
                          if (index !== -1) e.pairList.splice(index, 1);
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
                        .then(() => {
                          console.log("Sikeres párosítás");
                          $scope.loadPairs();
                        })
                        .catch((error) => {
                          console.log("Hiba a párosítás során: ", error);
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
              console.log("Hiba a régi párok törlése során: ", error);
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

        //Get if user from the class

        console.log($rootScope.loggedIn);

        if($rootScope.loggedIn === false){
          $location.path('/');
        }

        $http.post("./php/getUserData.php",{
          id: $rootScope.user.id
        }).then(
          function(response){
            $scope.data = response.data.data;
            $scope.imageURL = "./assets/pics/" +  $scope.data.class + "/" + $scope.data.image;
          })
          .catch(error => {console.log(error)});
        

        $scope.modify = () => {
          $http.post("./php/editUser.php", {
            email: $scope.model.email,
            password: $scope.model.password
          })
            .then(function (response) {
              console.log(response.data);

              $rootScope.msg = "Sikeresen módosította a fiókját" + $scope.name + "!";
              $rootScope.loginUser(response.data.data, $rootScope.msg);
              $scope.$applyAsync();
              $location.path('/');


            })
            .catch(error => {
              $rootScope.message = "Hiba történt: " + error;
              console.log($scope.Error);
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

        $http.post("./php/homeImages.php")
        .then(function (response) {
          $scope.homeImages = response.data.data;
          console.log($scope.homeImages);
          $scope.$applyAsync();
        })
        .catch(error => {
          console.log("Hiba:" + error);
        })
        
      }
    ])

    .controller('galleryController', [
      '$scope',
      'http',
      '$rootScope',
      '$location',
      function ($scope, http) {
        $scope.galleryImages = [];

        http.request({ url: './php/studentsGalleryImages.php' })
        .then(function (response) {
          $scope.galleryImages = response;
          console.log($scope.galleryImages);
          $scope.$applyAsync();
        })
        .catch(error => {
          console.log("Hiba:" + error);
        })
      }])

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
              name : "káresz",
              email: $scope.email_login,
              password: $scope.password_login
            }
          })
            .then(function (response) {
              console.log(response);
              $rootScope.msg = "Sikeresen bejelentkezett fiókjába, üdvözöljük " + response.last_name +" "+ response.first_name +"!";
              $rootScope.loginUser(response, $rootScope.msg);
              $rootScope.$applyAsync();
              $location.path('/');
            })
            .catch(error => {
              $rootScope.message = "Hiba történt a bejelentkezés során: " + error;
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
              console.log(response);

              $rootScope.msg = "Sikeres regisztráció, üdvözlünk " + $scope.name + "!";

              $rootScope.loginUser(response, $rootScope.msg);
              $scope.$applyAsync();
              $location.path('/');


            })
            .catch(error => {
              $rootScope.message = "Hiba történt a regisztráció során: " + error;
              console.log($scope.Error);
            })

        }
      }
    ])

    // Classes controller
    .controller('classesController', [
      '$scope',
      '$http',
      '$stateParams',
      function ($scope, $http, $stateParams) {
        $scope.className = $stateParams.class;
        $scope.ekezet = "áéíöüóőúű";
        $scope.ekezetNelkul = "aeiouoouu";
        $http.post("./php/getStudents.php", { class: $stateParams.class })
          .then(function (response) {
            $scope.students = response.data.data;
            $scope.studentsFolder = [];
            for(let i=0; i< $scope.students.length; i++){
              $scope.studentEdit = $scope.students[i].name.replaceAll(" ", "_").replace().toLowerCase();
              for(let j=0; j<$scope.ekezet.length; j++){
                $scope.studentEdit = $scope.studentEdit.replaceAll($scope.ekezet[j], $scope.ekezetNelkul[j]);
              }
              $scope.studentsFolder.push($scope.studentEdit);
            }
            $scope.hasBoys = $scope.students.some(x => x.gender === 'M');
            $scope.hasGirls = $scope.students.some(x => x.gender === 'F');
            $scope.hasBoth = $scope.hasBoys && $scope.hasGirls;
            $scope.$applyAsync();
          })
          .catch(error => {
            console.log("Hiba:" + error);
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
                    console.log("Nem található tiltott személy a listáján!");
                  }
                })

              $scope.$applyAsync();
            })
            .catch((error) => {
              console.log("Hiba:" + error);
            })
        }

        $scope.showStudentModal = (thisStudent) => {
          $scope.currentStudent = thisStudent;
        }

        $scope.blocklistEdit = (enable, currentEditStudent, currentBlockStudent) => {
          if (enable) {
            $http.post("./php/addBlock.php", { user_id: currentEditStudent.id, blocked_user_id: currentBlockStudent.id })
              .then(() => {
                console.log("Sikeres hozzáadás");
              })
              .catch((error) => {
                console.log("Hiba a hozzáadás során:" + error);
              })
          }
          else {
            $http.post("./php/removeBlock.php", { user_id: currentEditStudent.id, blocked_user_id: currentBlockStudent.id })
              .then(() => {
                console.log("Sikeres törlés");
              })
              .catch((error) => {
                console.log("Hiba a törlés során:" + error);
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

        $http.post("./php/eventImages.php")
          .then(function (response) {
            $scope.eventImages = response.data.data;
            console.log($scope.eventImages);
            $scope.$applyAsync();
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