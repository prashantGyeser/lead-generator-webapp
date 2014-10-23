angular.module('Users', [

])
.controller('UsersCtrl', function($scope, $http){
//        $scope.users = [
//            {"id": 1, "email": "prashant@urbanzeak.com", "subscribed": true, "no_leads": true, "signup_date": 1288323623006 },
//            {"id": 2, "email": "akhilesh@urbanzeak.com", "subscribed": false, "days_remaining": 10, "no_leads": true, "signup_date": 1288323623006 },
//            {"id": 3, "email": "srinivas@urbanzeak.com", "subscribed": true, "signup_date": 1288323623006 },
//            {"id": 4, "email": "ron@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 5, "email": "jules@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 6, "email": "prashant@urbanzeak.com", "subscribed": true, "signup_date": 1288323623006 },
//            {"id": 7, "email": "akhilesh@urbanzeak.com", "subscribed": true, "signup_date": 1288323623006 },
//            {"id": 8, "email": "srinivas@urbanzeak.com", "subscribed": true, "signup_date": 1288323623006 },
//            {"id": 9, "email": "ron@urbanzeak.com", "subscribed": true, "signup_date": 1288323623006 },
//            {"id": 10, "email": "jules@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 11, "email": "prashant@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 12, "email": "akhilesh@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 13, "email": "srinivas@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 14, "email": "ron@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 },
//            {"id": 15, "email": "jules@urbanzeak.com", "subscribed": false, "days_remaining": 10, "signup_date": 1288323623006 }
//        ];

        $scope.leadStreams = [
            {"id": 1, "name": "Indian in Austin", "user_id": 1, "leads": 10},
            {"id": 2, "name": "American in Austin", "user_id": 1, "leads": 5},
            {"id": 3, "name": "BBQ in Austin", "user_id": 1, "leads": 0},
            {"id": 4, "name": "Asian in Austin", "user_id": 2, "leads": 20},
            {"id": 5, "name": "Indian in Austin", "user_id": 3, "leads": 100},
            {"id": 6, "name": "BBQ in Austin", "user_id": 4, "leads": 15},
            {"id": 7, "name": "Cafe in Austin", "user_id": 5, "leads": 16},
            {"id": 8, "name": "Australian in Austin", "user_id": 6, "leads": 102},
            {"id": 9, "name": "Malaysian in Austin", "user_id": 7, "leads": 10}
        ];


        $http.get("http://localhost:3000/admin/users/all.json")
            .success(function(data){
                $scope.users = data.users;
            });

        $scope.selectedUser = null;

        $scope.setSelectedUser = function(user){
            $scope.selectedUser = user;
        };

    })
;