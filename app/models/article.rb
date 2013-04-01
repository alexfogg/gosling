# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  url        :text
#  summary    :text
#  pub        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :title, :url, :summary, :pub, :guid
  belongs_to :ryan

  def self.update_from_feed
    feed = Feedzirra::Feed.fetch_and_parse("https://news.google.com/news/feeds?hl=en&gl=us&q=ryan+gosling&um=1&ie=UTF-8&output=rss")
    add_entries(feed.entries)
  end

  def self.update_from_feed_continuously(delay_interval = 15.minutes)
    feed = Feedzirra::Feed.fetch_and_parse("https://news.google.com/news/feeds?hl=en&gl=us&q=ryan+gosling&um=1&ie=UTF-8&output=rss")
    add_entries(feed.entries)
    loop do
      sleep delay_interval
      feed = Feedzirra::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
  end

  private
    def self.add_entries(entries)
      entries.each do |entry|
        unless exists? :guid => entry.id
          create!(
            :title => entry.title,
            :url => entry.url,
            :summary => entry.summary,
            :pub => entry.published,
            :guid => entry.id
            )
        end
      end
    end
end
