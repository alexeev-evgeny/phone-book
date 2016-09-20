app.controller 'IndexCtrl', ($scope, $rootScope, dbService) ->

  $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts?q={}&h={
    "$fields": {
      "id": 1,
      "_id": 1,
      "avatar": 1,
      "name": 1,
      "email": 1,
      "phone": 1,
      "favorite": 1
    } }'
  
  $scope.contacts = {}
  dbService.load($scope.url).then((data) ->
    $scope.contacts = data
  )

  $scope.closeContact = () ->
    $scope.pageShifted = false
    $scope.openedContact = null
