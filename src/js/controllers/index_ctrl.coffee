app.controller 'IndexCtrl', ($scope, $http) ->

  $scope.initialize = () ->
    $scope.contacts = {}
    $scope.getAll()
    $scope.pageShifted = false
    $scope.openedContact = null

  $scope.getAll = () ->
    url = 'https://phonebook-c9b5.restdb.io/rest/contacts'
    $http
      .get(url)
      .then(
        (response) ->
          if response.data.length > 0
            $scope.contacts = response.data
            console.log $scope.contacts
        (error) ->
          console.log 'ERROR: '+error
      )
  $scope.openContact = (id) ->
    $scope.pageShifted = true
    $scope.openedContact = $scope.contacts[id]

  $scope.closeContact = () ->
    $scope.pageShifted = false
    $scope.openedContact = null

  $scope.initialize()
  