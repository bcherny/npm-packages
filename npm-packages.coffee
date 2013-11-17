
scrape = require 'scrape'

packages = (user) ->

	api = 'https://npmjs.org/browse/author/:user'

	request = (url, total = 0, page = 0) ->

		scrape.request "#{url}/#{page}", (err, $) ->

			rows = $ '#package .row'
			count = rows.length

			if count > 1

				total += count
				request url, total, ++page

			else

				resolve total

	getUrl = (user) ->

		api.replace ':user', user

	resolve = (count) ->

		console.log count

	request getUrl user

packages 'isaacs'