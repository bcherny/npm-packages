
promise = require 'when'
scrape = require 'scrape'
api = 'https://npmjs.org/browse/author/:user/:page'

getUrl = (user = '', page = 0) ->
	(api.replace ':user', user).replace ':page', page

packages = (user) ->

	deferred = promise.defer()
	page = -1
	total = 0
	requests = 0

	request = ->

		++requests

		url = getUrl user, ++page
		scrape.request url, (err, $) ->
			process err, $

	process = (err, $) ->

		rows = $ '#package .row'
		count = rows.length

		if err or (count is 1 and request is 1)
			deferred.reject err

		else

			if count > 1

				total += count
				deferred.notify total
				request()

			else

				deferred.resolve total

	# go!
	request()

	# return
	deferred.promise

module.exports = packages