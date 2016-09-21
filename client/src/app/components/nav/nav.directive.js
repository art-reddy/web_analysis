import { NavController } from './nav.controller';

export function NavDirective() {
  'ngInject';

  let directive = {
    templateUrl: 'app/components/nav/nav.html',
    controller: NavController
  };

  return directive;
}
