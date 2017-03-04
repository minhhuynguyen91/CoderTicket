module EventsHelper
  def header_background_image_url
    image_path('color-me-run.jpg')
  end

  def check_user_permission(event_id)
    @event = Event.find_by_id(event_id)
    @owners = @event.ownerships.collect {|o| o.owner_id}
    current_user.id == @event.user_id || @owners.include?(current_user.id)
  end

end
