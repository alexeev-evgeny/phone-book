app.config(['$routeProvider', ($routeProvider) ->

  $routeProvider
    .when('/', {
      templateUrl: 'views/index/index.html',
      controller: 'IndexCtrl'
    })
    # .when('/:id/view', {
    #   templateUrl: 'views/contacts/view.html',
    #   controller: 'IndexCtrl'
    # })
])
