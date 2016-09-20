app.controller 'parentCtrl', ($scope, $rootScope) ->

  $rootScope.sortDirection = false
  $scope.toggleSortDirection = () ->
    $rootScope.sortDirection = !$rootScope.sortDirection

  $rootScope.showOnlyFavorites = false
  $scope.toggleFavoritesVisible = () ->
    $rootScope.showOnlyFavorites = !$rootScope.showOnlyFavorites
    
  $scope.checkFavoriteState = (favoriteState) ->
    if !$rootScope.showOnlyFavorites
      return true

    if favoriteState
      return true
