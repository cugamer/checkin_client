module LocationsHelper
	def getAllLocationsByCompanyId(compID)
		baseUrl = "localhost:9393"
		# Returns an array of hashes which contain the locations information.
		return HTTParty.get("http://#{baseUrl}/locations/?company_id=#{compID}").parsed_response["data"]
	end

	def addLocation(params)
		baseUrl = "localhost:9393"
		p "Client id: #{current_client[:id]}"
		params['company_id'] = params['company_id'] || current_client[:id]
		p "Params: #{params}"
		return HTTParty.post("http://#{baseUrl}/locations", 
			:body => params.to_json,
			:headers => { 'Content-Type' => 'application/json' })
	end
end
