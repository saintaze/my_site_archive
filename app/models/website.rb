require 'uri'

class Website < ApplicationRecord
    has_many :webpages, dependent: :destroy
    has_many :zone_files, dependent: :destroy

    validates :title, :url, presence: true
    validates :url, url: true

    before_save :remove_path_from_url

    private

        def remove_path_from_url
            self.url = URI.join(self.url, "/").to_s
        end
end