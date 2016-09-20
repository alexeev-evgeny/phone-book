app.controller 'EditCtrl', ($scope, $location, $routeParams, $log, dbService) ->

  $scope.openedContact = null

  $scope.load = () ->
    dbService.load($scope.url).then((data) ->
      $scope.openedContact = data
    )    

  $scope.save = () ->
    dbService.save($scope.url, $scope.openedContact).then((result) ->
      if result.status == 200
        $location.path('/view/'+$routeParams.id)
      else
        $log.error(result)
    )

  $scope.deleteContact = () ->
    if confirm('Delete a contact?')
      dbService.delete($scope.url).then((result) ->
        if result.status == 200
          $location.path('/')
        else
          $log.error(result)
      )

  if $routeParams.id
    $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts/'+$routeParams.id
    $scope.load()
  else
    $location.path('/')
