export function routerConfig ($routeProvider) {
  'ngInject';
  $routeProvider
    .when('/', {
      templateUrl: 'app/main/main.html',
      controller: 'MainController',
      controllerAs: 'main'
    })
    .when('/referrers', {
      templateUrl: 'app/referrers/referrers.html',
      controller: 'ReferrersController',
      controllerAs: 'referrers'
    })
    .otherwise({
      redirectTo: '/'
    });
}
