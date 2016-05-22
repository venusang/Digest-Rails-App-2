require 'singleton'

module AP
  module DigestGem
    module DigestG
      
      # Creates the account.
      # +config+ configuration properties should contain
      def self.config_account(config={})
       config = HashWithIndifferentAccess.new(config)
       Config.instance.configuration ||= HashWithIndifferentAccess.new
       Config.instance.configuration = Config.instance.configuration.merge(config)
      end
      
      class Config
        include Singleton
        
        attr_accessor :latest_version, :configuration
      end
      
    end
  end
end