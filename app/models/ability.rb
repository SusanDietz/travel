class Ability
  include CanCan::Ability

  def initialize(user)
        user ||= User.new
        can :read, :all
        can :destroy,  Itinerary do |itinerary|
            itinerary.try(:user_id) == user.id
        end
        can :create, Point do |point|
            point.itinerary.try(:user_id) == user.id
        end
        can :create, Itinerary
  end
end
