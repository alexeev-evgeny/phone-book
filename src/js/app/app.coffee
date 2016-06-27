dependencies = ['ngRoute']

this.app = angular.module('app', dependencies);

app.run(['$http', '$rootScope', ($http, $rootScope) ->
  $http.defaults.headers.common['Content-Type'] = 'application/json'
  $http.defaults.headers.common['Accept'] = 'application/json'
  $http.defaults.headers.common['x-apikey'] = '576e6162b9d4b50b4dc9d916'
])  

app.config(['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
])
