app.service 'dbService', ($http, $log) ->

  @load = (url) =>
    $http
      .get(url)
      .then(
        (response) ->
          return response.data
        (error) ->
          $log.error('ERROR: ' + error)
      )

  @save = (url, data) =>
    $http
      .put(url, data)
      .success((data, status, headers, config) ->
        $log.info('DATA SAVE: SUCCESSFULL')
      )
      .error((data, status, header, config) ->
        $log.error('DATA SAVE ERROR:', status, data)
      )

  @add = (url, data) =>
    dataJson = angular.toJson(data)
    $http
      .post(url, dataJson)
      .success((data, status, headers, config) ->
        $log.info('DATA SAVE: SUCCESSFULL', status, data)
      )
      .error((data, status, header, config) ->
        $log.error('DATA SAVE ERROR:', status, data)
      )

  @delete = (url) =>
    $http
      .delete(url)
      .success((data, status) ->
        $log.info('DATA DELETE: SUCCESSFULL', status, data)
      )
      .error((data, status, header, config) ->
        $log.error('DATA DELETE ERROR:', status, data)
      )

  return @