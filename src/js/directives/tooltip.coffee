app.directive('tooltip', () ->
  restrict: 'A'
  templateUrl: 'views/directives/tooltip.html'
  scope:
    tooltipValue: '='
  link: (scope, element, attrs) ->
  	angular.element(element).addClass('pb-tooltip-box');
)