export class MainController {
  constructor (topUrlsProvider) {
    'ngInject';

    this.topUrls = topUrlsProvider.getTopUrls();
    this.topReferrers = topUrlsProvider.getTopReferrers();
  }
}
