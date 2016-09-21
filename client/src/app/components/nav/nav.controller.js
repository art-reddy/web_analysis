export class NavController {
  constructor ($scope, $location) {
    'ngInject';

    $scope.isActive = function(currentLocation) {
      return currentLocation === $location.path();
    }
  }
}
