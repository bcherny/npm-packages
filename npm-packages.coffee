
promise = require 'when'
scrape = require 'scrape'
api = 'https://npmjs.org/browse/author/:user/:page'

getUrl = (user = '', page = 0) ->
	(api.replace ':user', user).replace ':page', page

packages = (user) ->

	deferred = promise.defer()
	page = -1
	total = 0

	request = ->

		url = getUrl user, ++page
		scrape.request url, (err, $) ->
			process err, $

	process = (err, $) ->

			if err
				deferred.reject err

			else

				rows = $ '#package .row'
				count = rows.length

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

packages('dominictarr').then (total) ->
	console.log total

module.exports = packages