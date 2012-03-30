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
      if @login_uri
        login_to_pro( @login_uri, @login, @password )
        link = @agent.links.map{|link| link if link.text == "Rss"}.compact.first
        @body = link.click.body
      else
        @body = open( @free_uri ).read
      end
      @body
    end

    private

      def login_to_pro( login_uri, login, password )
        @agent = Mechanize.new.get( login_uri )
        @agent.form.login = login
        @agent.form.password = password
        @agent = @agent.form.submit
      end
  end
end
