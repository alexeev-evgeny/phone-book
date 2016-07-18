app.controller 'ViewCtrl', ($scope, $http, $routeParams, $log) ->
  console.log 'VIEWCTRL '+$scope

  $scope.initialize = () ->
    $scope.openedContact = null
    $scope.load()

    $scope.$watch('currentContactId', -> $scope.load())

  $scope.load = () ->
    url = 'https://phonebook-c9b5.restdb.io/rest/contacts/'+$routeParams.id
    $http
      .get(url)
      .then(
        (response) ->
          if response.data
            $scope.openedContact = response.data
        (error) ->
          $log.error 'ERROR: '+error
      )

  $scope.initialize()
