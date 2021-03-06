// Generated by CoffeeScript 1.6.3
var api, getUrl, packages, promise, scrape;

promise = require('when');

scrape = require('scrape');

api = 'https://npmjs.org/browse/author/:user/:page';

getUrl = function(user, page) {
  if (user == null) {
    user = '';
  }
  if (page == null) {
    page = 0;
  }
  return (api.replace(':user', user)).replace(':page', page);
};

packages = function(user) {
  var deferred, page, process, request, requests, total;
  deferred = promise.defer();
  page = -1;
  total = 0;
  requests = 0;
  request = function() {
    var url;
    ++requests;
    url = getUrl(user, ++page);
    return scrape.request(url, function(err, $) {
      return process(err, $);
    });
  };
  process = function(err, $) {
    var count, rows;
    rows = $('#package .row');
    count = rows.length;
    if (err || (count === 1 && requests === 1)) {
      return deferred.reject(err);
    } else {
      if (count > 1) {
        total += count;
        deferred.notify(total);
        return request();
      } else {
        return deferred.resolve(total);
      }
    }
  };
  request();
  return deferred.promise;
};

module.exports = packages;
