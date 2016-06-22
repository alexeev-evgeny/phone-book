dependencies = ['ngRoute']

this.app = angular.module('app', dependencies);

app.run(['$http', '$rootScope', ($http, $rootScope) ->
  $http.defaults.headers.common['Content-Type'] = 'application/json'
  $http.defaults.headers.common['Accept'] = 'application/json'

  token = localStorage.getItem('user.token')
  $http.defaults.headers.common['X-User-Token'] = token

  # $http
  #   .get('/api/status')
  #   .then((response) =>
  #     _.extend($rootScope, response.data)
  #   )
])

app.config(['$httpProvider', ($httpProvider) ->
  error = ((rejection) ->
    alert('Ошибка; попробуйте повторить действие или обратитесь к ' +
      'администрации (код: ' + rejection.status + ' ' + rejection.statusText +
      ')')
  )

  $httpProvider.interceptors.push(['$q', ($q) ->
    return {
      requestError: ((rejection) ->
        error(rejection)
        return $q.reject(rejection);
      )
      responseError: ((rejection) ->
        error(rejection)
        return $q.reject(rejection);
      )
    };
  ]);
])

app.config(['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
])
