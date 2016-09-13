app.controller 'HeadCtrl', ($scope, $rootScope) ->

  $rootScope.sortDirection = false
  $scope.toggleSortDirection = () ->
    $rootScope.sortDirection = !$rootScope.sortDirection
