module Mksite
  module Command
    class Build
      def self.run
        site = Mksite::Site.new(Dir.pwd)

        site.build
      end
    end
  end
end
