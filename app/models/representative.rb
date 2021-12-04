# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []
        rep_info.officials.each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''
            photo_url_temp = ''
            line1_temp = ''
            city_temp = ''
            state_temp = ''
            zip_temp = ''
            party_temp = ''
            rep_info.offices.each do |office|
                next unless office.official_indices.include? index

                title_temp = office.name
                ocdid_temp = office.division_id
                photo_url_temp = official.photo_url
                unless official.address.nil?
                    line1_temp = official.address[0].line1
                    city_temp = official.address[0].city
                    state_temp = official.address[0].state
                    zip_temp = official.address[0].zip
                end
                party_temp = official.party
            end
            rep = Representative.find_or_create_by!({ name: official.name, ocdid: ocdid_temp,
                title: title_temp, photoUrl: photo_url_temp, line1: line1_temp, city: city_temp,
                state: state_temp, zip: zip_temp, party: party_temp })
            reps.push(rep)
        end
        reps
    end
end
