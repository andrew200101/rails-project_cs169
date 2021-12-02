# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''
            photoUrl_temp = ''
            line1_temp = ''
            city_temp = ''
            state_temp = ''
            zip_temp = ''
            party_temp = ''
            

            rep_info.offices.each do |office|
                if office.official_indices.include? index
                    title_temp = office.name
                    ocdid_temp = office.division_id
                    photoUrl_temp_temp = office.photoUrl
                    line1_temp = office.line1
                    city_temp = office.city 
                    state_temp = office.state
                    zip_temp = office.zip 
                    party_temp = office.party
                    
                end
            end

            rep = Representative.find_or_create_by!({ name: official.name, ocdid: ocdid_temp,
                title: title_temp, photoUrl: photoUrl_temp, line1: line1_temp,  city: city_temp, 
                state: state_temp, zip: zip_temp, party: party_temp})
            reps.push(rep)
        end

        reps
    end
end
