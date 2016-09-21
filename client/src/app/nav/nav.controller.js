export class NavController {
  constructor ($location) {
    'ngInject';

    this..$location = $location;
  }

  isActive(viewLocation) {
    return viewLocation === this.$location.path();
  }
}
