class ApplicationController < ActionController::Base
  def compare
    render({ :template => "comparison.html.erb"})

  end

  def analytics
    render({ :template => "analytics.html.erb"})


  end

  def properties
    render({ :template => "properties.html.erb"})

  end


end
