app.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
    .when('/', {
      templateUrl: '/contacts.html',
      controller: 'IndexCtrl'
    })
])
