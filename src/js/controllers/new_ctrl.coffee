app.controller 'NewCtrl', ($scope, $location, $log, dbService) ->

  $scope.newContact = null
  $scope.url = 'https://phonebook-c9b5.restdb.io/rest/contacts'
  $scope.emailPattern = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i

  $scope.add = () ->
    switch
      when !$scope.newContactForm.$valid then alert('Form is invalid')
      when !$scope.newContact then alert('Form is empty')
      else dbService.add($scope.url, $scope.newContact).then((result) ->
              if result.status == 201
                $location.path('/')
              else
                $log.error(result)
            )
