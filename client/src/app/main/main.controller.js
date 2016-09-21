export class MainController {
  constructor (topUrlsProvider) {
    'ngInject';
    this.topUrls = topUrlsProvider.getTopUrls();

    this.loadingText = 'Loading top URL\'s...';
    this.topUrls.$promise.then(() => {
      this.loadingText = null;
    });
  }
}
