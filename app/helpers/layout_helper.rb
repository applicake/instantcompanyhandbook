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

  def applicake_menu
    applicake_base_url = 'http://applicake.com/'
    haml_tag :ul do
      # array of pairs: menu text, url address; if
      # the url is the same as the menu text, it can
      # be ommitted
      [ ['home', ''],
        'blog',
        'services',
        'team',
        'projects',
        ['our way', 'appliway'],
        'jobs',
        'contact'
      ].each do |entity|
        haml_tag :li do
          if entity.is_a? Array
            haml_concat link_to(entity.first, "#{applicake_base_url}#{entity.second}")
          else
            haml_concat link_to(entity, "#{applicake_base_url}#{entity}")
          end
        end
      end
    end
  end

end
