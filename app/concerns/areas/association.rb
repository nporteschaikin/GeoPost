module Areas
  module Association

    extend ActiveSupport::Concern

    module ClassMethods

      def area_associations *associations
        associations.each do |association|

          define_method association do
            "#{association}".classify.constantize.within bounds
          end
          
        end
      end

    end

  end
end
