app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'views/contacts/list.html',
      controller: 'IndexCtrl'
    })
    .when('/new', {
      templateUrl: 'views/contacts/new.html',
      controller: 'NewCtrl'
    })
    .when('/view/:id', {
      templateUrl: 'views/contacts/view.html',
      controller: 'ViewCtrl'
    })
    .when('/edit/:id', {
      templateUrl: 'views/contacts/edit.html',
      controller: 'EditCtrl'
    })
    .otherwise({
      'redirectTo': '/'
    })
])
