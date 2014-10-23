angular.module('Users', [

])
.controller('UsersCtrl', function($scope){
        $scope.users = [
            {"id": 1, "email": "prashant@urbanzeak.com"},
            {"id": 2, "email": "akhilesh@urbanzeak.com"},
            {"id": 3, "email": "srinivas@urbanzeak.com"},
            {"id": 4, "email": "ron@urbanzeak.com"},
            {"id": 5, "email": "jules@urbanzeak.com"}
        ];
    })
;