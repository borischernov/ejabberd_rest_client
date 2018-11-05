require 'uri'
require 'net/http'
require 'json'
class EjabberdRestClient
	def initialize(url, jid, password)
		@url = url
		@jid = jid
		@password = password
	end

	def request(method, data = {})
		url = URI.parse(@url)
		url.path = "/api/#{method}"
		begin
			http = Net::HTTP.new(url.host, url.port)
			request = Net::HTTP::Post.new(url.path)
			request.basic_auth @jid, @password if @jid
			request.body = data.to_json
			request["Content-Type"] = 'application/json'
			request["Accept"] = 'application/json'
			response = http.request(request)
			return nil unless response.code.to_i == 200
			JSON.parse("[#{response.body}]").first
		rescue
			$logger.error("Exception while accessing ejabberd API: #{$!}")
		end
	end
end
