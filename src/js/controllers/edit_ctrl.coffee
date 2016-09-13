app.controller 'EditCtrl', ($scope, $location, $routeParams, dbService) ->

  $scope.openedContact = null

  $scope.load = () ->
    dbService.load($scope.url).then((data) ->
      $scope.openedContact = data
    )    

  $scope.save = () ->
    dbService.save($scope.url, $scope.openedContact).then(
      $location.path('/view/'+$routeParams.id)
    )

  if $routeParams.id
    $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts/'+$routeParams.id
    $scope.load()
  else
    $location.path('/')
