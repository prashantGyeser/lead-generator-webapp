var myApp = angular.module('adminApp', []);


myApp.factory('Server', ['$http', function ($http) {
  return {
    get: function(url) {
      return $http.get(url);
    },
    post: function(url) {
      return $http.post(url);
    }
  };
}]);

myApp.controller('UserCtrl', ['$scope', 'Server', '$http', function ($scope, Server, $http) {

  $scope.showActive = '';

  var users_url = '/admin/angular_admin/all_users.json';

  $http.get(users_url ).then(function(resp) {
    console.log('Success', resp);
    $scope.users = resp.data;
  }, function(err) {
    console.error('ERR', err);
    // err.status will contain the status code
  })

}]);


