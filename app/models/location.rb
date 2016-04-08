class Location < ActiveRecord::Base
	belongs_to :client

	LATTITUDE_FORMAT = /\d{1,2}\.\d{4}/
	LONGITUDE_FORMAT = /\d{1,3}\.\d{4}/

	validates :lattitude, presence: true, format: { with: /\d{1,2}\.\d{4}/ }
	validates :hemi_n_s, presence: true
	validates :longitude, presence: true, format: { with: /\d{1,3}\.\d{4}/ }
	validates :hemi_e_w, presence: true
	validates :client_id, presence: true
end
