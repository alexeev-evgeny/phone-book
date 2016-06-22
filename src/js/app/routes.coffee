app.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
    .when('/', {
      templateUrl: '/main.html',
      controller: 'IndexCtrl'
    })
])
