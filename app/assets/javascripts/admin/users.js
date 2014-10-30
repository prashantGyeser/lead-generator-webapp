angular.module('Users', [

])
.controller('UsersCtrl', function($scope, $http){

        $http.get("http://www.urbanzeak.com/admin/users/all.json")
        //$http.get("http://localhost:3000/admin/users/all.json")
            .success(function(data){
                $scope.users = data.users;
                console.log($scope.users);
            });

        $http.get("http://www.urbanzeak.com/admin/lead_streams.json")
        //$http.get("http://localhost:3000/admin/lead_streams.json")
            .success(function(data){
                $scope.leadStreams = data.leadStreams;
            });

        $scope.selectedUser = null;

        $scope.setSelectedUser = function(user){
            $scope.selectedUser = user;
        };

        $scope.showActiveUsers = function(){
            angular.forEach($scope.users, function(user){
                if(user.days_remaining > 0){
                    user.hidden = false;
                }
                else
                {
                    user.hidden = true;
                }
            });
        }


    });