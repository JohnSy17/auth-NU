class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new
    @activity["contact_id"] = params["contact_id"]
    @activity["activity_type"] = params["activity_type"]
    @activity["note"] = params["note"]
    @activity["user_id"] = session["user_id"] #links an activity to the individual.
    @activity.save
    redirect_to "/contacts/#{@activity["contact_id"]}"
  end

end
