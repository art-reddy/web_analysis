import { config } from './index.config';
import { routerConfig } from './index.route';
import { runBlock } from './index.run';
import { TopUrlsProviderService } from './components/top_urls/top_urls_provider.service';
import { MainController } from './main/main.controller';

angular.module('webAnalysis', ['ngResource', 'ngRoute', 'ui.bootstrap'])
  .config(config)
  .config(routerConfig)
  .run(runBlock)
  .service('topUrlsProvider', TopUrlsProviderService)
  .controller('MainController', MainController)
