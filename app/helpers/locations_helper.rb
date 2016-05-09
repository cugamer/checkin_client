module LocationsHelper
	def getAllLocationsByCompanyId(compID)
		baseUrl = "localhost:9393"
		# Returns an array of hashes which contain the locations information.
		return HTTParty.get("http://#{baseUrl}/locations/?company_id=#{compID}").parsed_response["data"]
	end

	def getSpecificLocation(locID)
		baseUrl = "localhost:9393"
		return HTTParty.get("http://#{baseUrl}/locations/#{locID}").parsed_response["data"]
		# return formatResponse(response)
	end

	def addLocation(params)
		baseUrl = "localhost:9393"
		params['company_id'] = params['company_id'] || current_client[:id]
		return HTTParty.post("http://#{baseUrl}/locations", 
			:body => params.to_json,
			:headers => { 'Content-Type' => 'application/json' }).parsed_response
	end

	def deleteLocation(locationId)
		baseUrl = "localhost:9393"
		return HTTParty.delete("http://#{baseUrl}/locations/#{locationId}").parsed_response
	end

	def updateLocation(locationId, params)
		baseUrl = "localhost:9393"
		return HTTParty.put("http://#{baseUrl}/locations/#{locationId}",
			:body => params.to_json,
			:headers => { 'Content-Type' => 'application/json' }).parsed_response
	end

	private
		def formatResponse(rawResponse)
			response = {"data" => {}, "error" => {}}
			return response.merge(rawResponse)
		end
end
