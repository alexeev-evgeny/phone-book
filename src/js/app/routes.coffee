app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'views/contacts/list.html',
      controller: 'IndexCtrl'
    })
    .when('/view/:id', {
      templateUrl: 'views/contacts/view.html',
      controller: 'ViewCtrl'
    })
  .otherwise({
    'redirectTo': '/'
  })
])
