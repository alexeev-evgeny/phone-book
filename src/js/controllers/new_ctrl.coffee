app.controller 'NewCtrl', ($scope, $location, dbService) ->

  $scope.newContact = null
  $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts/'

  $scope.add = () ->
    console.log $scope.newContact
    dbService.add($scope.url, $scope.newContact).then(
      $location.path('/')
    )
