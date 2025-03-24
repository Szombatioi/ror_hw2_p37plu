class IndexController < ApplicationController
    def home
        @lands = Land.includes(:records).all.map do |land|
        {
            land: land,
            record_count: land.records.count,
            lyrics_count: land.records.where.not(lyrics: nil).where.not(lyrics: '').count,
            links_count: land.records.where.not(link: nil).where.not(link: '').count
        }
        end
    end
end
