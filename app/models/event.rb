class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types
  
  belongs_to :user
  
  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  accepts_nested_attributes_for :venue

  def self.search(search)
    if search
      where("name ILIKE ?", "%#{search}%") 
    else
      where
    end
  end

  def self.upcoming
    where("starts_at > ?",Time.now)
  end

end
