app.controller 'NewCtrl', ($scope, $location, dbService) ->

  $scope.newContact = null
  $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts'

  $scope.add = () ->
    if $scope.newContactForm.$valid
      dbService.add($scope.url, $scope.newContact).then(
        $location.path('/')
      )
    else
      alert('Form is invalid')
