module RailscastsDownload
  class PageExplorer
    require 'mechanize'

    def initialize( options = {} )
      if options[:revised]
        @login_uri = options[:login_uri]
        @login     = options[:login]
        @password = options[:password]
      else
        @free_uri = options[:rss_uri]
      end
    end

    def get_rss_body
      if @login
        login_to_pro( @login_uri, @login, @password )
        link = get_rss_link
        @body = link.click.body
      else
        @body = open( @free_uri ).read
      end
      @body
    end

    private
      def get_rss_link
        @agent.links.map{|link| link if link.text == "Rss"}.compact.first
      end

      def valid_signed_in!
        unless get_rss_link
          puts '!!! Bad login/password combination !!!'
          exit
        end
      end

      def login_to_pro( login_uri, login, password )
        @agent = Mechanize.new.get( login_uri )
        @agent.form.login = login
        @agent.form.password = password
        @agent = @agent.form.submit
        valid_signed_in!
      end
  end
end
