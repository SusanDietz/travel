module ItinerariesHelper
  def can_view_self_itineraries?
    params[:owned].present? && current_user.present?
  end
end
