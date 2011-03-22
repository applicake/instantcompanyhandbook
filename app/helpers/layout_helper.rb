module LayoutHelper

  # prints notice/alert variable, if they are being
  # sent to the view from the controller
  def alerts
    haml_tag :div, :class => 'alerts', :id => 'alerts' do
      haml_tag :div, :class => 'success' do
        haml_concat notice
      end if notice
      haml_tag :div, :class => 'error' do
        haml_concat alert
      end if alert
    end if alert || notice
  end
end
