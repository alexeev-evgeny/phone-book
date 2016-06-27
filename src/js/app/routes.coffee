app.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
    .when('/', {
      templateUrl: 'views/contacts/list.html',
      controller: 'IndexCtrl'
    })
])
