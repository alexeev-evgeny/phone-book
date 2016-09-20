app.controller 'EditCtrl', ($scope, $location, $routeParams, $log, dbService) ->

  $scope.openedContact = null

  $scope.emailPattern = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
  $scope.phonePattern = /^[+\d\s]+$/

  $scope.load = () ->
    dbService.load($scope.url).then((data) ->
      $scope.openedContact = data
    )    

  $scope.save = () ->
    switch
      when !$scope.editContactForm.$valid then alert('Form is invalid')
      when !$scope.openedContact then alert('Form is empty')
      else dbService.save($scope.url, $scope.openedContact).then((result) ->
        if result.status == 200
          $location.path('/view/' + $routeParams.id)
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
    $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts/' + 
      $routeParams.id
    $scope.load()
  else
    $location.path('/')
