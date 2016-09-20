export class TopUrlsProviderService {
  constructor ($resource) {
    'ngInject';

    this.$resource = $resource;
  }

  getTopUrls() {
    return this.$resource('/top_urls', {}, {
      query: {
        method: 'GET'
      }
    }).query();
  }

  getTopReferrers() {
    return this.$resource('/top_referrers', {}, {
      query: {
        method: 'GET'
      }
    }).query();
  }
}
