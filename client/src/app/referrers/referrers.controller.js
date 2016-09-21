export class ReferrersController {
  constructor (topUrlsProvider) {
    'ngInject';
    this.topReferrers = topUrlsProvider.getTopReferrers();

    this.loadingText = 'Loading top URL\'s with referrers...';
    this.topReferrers.$promise.then(() => {
      this.loadingText = null;
    });
  }
}
