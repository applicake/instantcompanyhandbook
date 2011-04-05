module LayoutHelper

  # returns the google analytics account id; should be set
  # in the config/passwords.yml (as some other crutial
  # attributes)
  def analytics_account
    YAML.load_file("#{Rails.root}/config/passwords.yml")['analytics']['account']
  end

  # puts the google analytics tracking script
  def analytics_tracking account
    haml_tag :script, :type => "text/javascript" do
      haml_concat """
      //<![CDATA[
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '#{account}']);
      _gaq.push(['_trackPageview']);

      (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
      //]]>
      """
    end
  end


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
