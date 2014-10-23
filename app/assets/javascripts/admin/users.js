angular.module('Users', [

])
.controller('UsersCtrl', function($scope){
        $scope.users = [
            {"id": 1, "email": "prashant@urbanzeak.com", "subscribed": true, "no_leads": true},
            {"id": 2, "email": "akhilesh@urbanzeak.com", "subscribed": false, "days_remaining": 10, "no_leads": true},
            {"id": 3, "email": "srinivas@urbanzeak.com", "subscribed": true},
            {"id": 4, "email": "ron@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 5, "email": "jules@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 1, "email": "prashant@urbanzeak.com", "subscribed": true},
            {"id": 2, "email": "akhilesh@urbanzeak.com", "subscribed": true},
            {"id": 3, "email": "srinivas@urbanzeak.com", "subscribed": true},
            {"id": 4, "email": "ron@urbanzeak.com", "subscribed": true},
            {"id": 5, "email": "jules@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 1, "email": "prashant@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 2, "email": "akhilesh@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 3, "email": "srinivas@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 4, "email": "ron@urbanzeak.com", "subscribed": false, "days_remaining": 10},
            {"id": 5, "email": "jules@urbanzeak.com", "subscribed": false, "days_remaining": 10}
        ];
    })
;