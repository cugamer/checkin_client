class Location < ActiveRecord::Base
	include ActiveModel::Model

	# attr_accessor :client_id, :lattitude, :hemi_n_s, :longitude, :hemi_e_w

	# belongs_to :client

	# LATTITUDE_FORMAT = /\d{1,2}\.\d{4}/
	# LONGITUDE_FORMAT = /\d{1,3}\.\d{4}/

	# validates :client_id, presence: true
	# validates :lattitude, presence: true, format: { with: /\d{1,2}\.\d{4}/ }
	# validates :hemi_n_s, presence: { message: "N\\S Hemisphere must be specified."}
	# validates :longitude, presence: true, format: { with: /\d{1,3}\.\d{4}/ }
	# validates :hemi_e_w, presence: { message: "E\\W Hemisphere must be specified."}
end
