app.controller 'IndexCtrl', ($scope, $http, $location, $log) ->
  console.log 'INDEXCTRL '+$scope

  $scope.initialize = () ->
    $scope.contacts = {}
    $scope.load()

  $scope.load = () ->
    url = 'https://phonebook-c9b5.restdb.io/rest/contacts?q={}&h={
      "$fields": {
        "id": 1,
        "_id": 1,
        "avatar": 1,
        "name": 1,
        "email": 1,
        "phone": 1
      } }'
    $http
      .get(url)
      .then(
        (response) ->
          if response.data.length > 0
            $scope.contacts = response.data
        (error) ->
          $log.error 'ERROR: '+error
      )

  $scope.closeContact = () ->
    $scope.pageShifted = false
    $scope.openedContact = null

  $scope.initialize()
  