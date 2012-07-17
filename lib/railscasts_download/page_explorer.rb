module RailscastsDownload
  class PageExplorer
    require 'mechanize'

    def initialize( options = {} )
      if options[:pro]
        @login_uri = options[:login_uri]
        @login     = options[:login]
        @password = options[:password]
      else
        @free_uri = options[:rss_uri]
      end
      @proxy = options[:proxy]
    end

    def get_rss_body
      if @login
        login_to_pro( @login_uri, @login, @password )
        @body = pro_rss_link.click.body
      else
        @body = open( @free_uri ).read
      end
    end

    private
      def pro_rss_link
        @page_with_rss_link = @agent.mech.get("https://railscasts.com/subscriptions/current")
        @page_with_rss_link.links.map{|link| link if link.text == "RSS Feed"}.compact.first
      end

      def validate_signed_in!
        unless @page.links.map{|link| link if link.text == "Rss"}.compact.first
          puts '!!! Bad login/password combination !!!'
          exit
        end
      end

      def login_to_pro( login_uri, login, password )
        @agent = Mechanize.new.get( login_uri )
        @agent.set_proxy( @proxy.split(':') ) unless @proxy.nil?
        @agent.form.login = login
        @agent.form.password = password
        @page = @agent.form.submit
        validate_signed_in!
      end
  end
end
