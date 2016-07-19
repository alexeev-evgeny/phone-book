app.controller 'ViewCtrl', ($scope, $http, $routeParams, $log, dbService) ->

  $scope.openedContact = null
  $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts/'+$routeParams.id

  dbService.load($scope.url).then((data) ->
    $scope.openedContact = data
  )
