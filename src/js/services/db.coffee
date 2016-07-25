app.service 'dbService', ($http, $log) ->

  @load = (url) =>
    $http
      .get(url)
      .then(
        (response) ->
          return response.data
        (error) ->
          $log.error 'ERROR: '+error
      )

  @save = (url, data) =>
    $http
      .put(url, data)
      .success((data, status, headers, config) ->
        $log.info 'DATA SAVE: successful'
      )
      .error((data, status, header, config) ->
        $log.error 'DATA SAVE ERROR: '+status
      )

  return @