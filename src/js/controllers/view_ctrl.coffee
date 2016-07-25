app.controller 'ViewCtrl', ($scope, $routeParams, $location, dbService) ->

  $scope.openedContact = null

  if $routeParams.id
    $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts/'+$routeParams.id

    dbService.load($scope.url).then((data) ->
      $scope.openedContact = data
    )
  else
    $location.path('/')
