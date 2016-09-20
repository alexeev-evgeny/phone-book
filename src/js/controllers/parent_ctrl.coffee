app.controller 'parentCtrl', ($scope, $rootScope) ->

  $rootScope.sortDirection = false
  $scope.toggleSortDirection = () ->
    $rootScope.sortDirection = !$rootScope.sortDirection

  # $rootScope.searchText = ''