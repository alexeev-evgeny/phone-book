app.controller 'IndexCtrl', ($scope, $http) ->
  $scope.contacts = {}

  $scope.getAll = () ->
    $http
      .get('https://phonebook-c9b5.restdb.io/rest/contacts')
      .then(
        (response) ->
          if response.data.length > 0
            $scope.contacts = response.data
            console.log $scope.contacts
        () ->
          console.log 'ERROR: database in unavailable'
      )

  $scope.getAll()
