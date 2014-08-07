class Ability
  include CanCan::Ability

  def initialize(user)
        can :read, :all
        can :destroy,  Itinerary do |itinerary|
            itinerary.try(:user_id) == user.id
        end
        can :create, Point do |point|
            point.itinerary.try(:user_id) == user.id
        end
  end
end
