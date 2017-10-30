class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction = self.attraction
    user = self.user
    alert = "Sorry."
    alert << " You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    alert << " You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    if alert.length < 7
      alert = "Thanks for riding the #{attraction.name}!"
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
    alert
  end
end
