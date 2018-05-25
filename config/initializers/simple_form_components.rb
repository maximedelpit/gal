module SimpleForm
  module Components
    module Icons
      attr_reader :options_scope
      def icon(wrapper_options = nil)
        find_options_scope
        return icon_class unless @options_scope[1][:icon].nil?
      end

      def icon_class
        icon_tag = template.content_tag(:i, '', class: @options_scope[1][:icon])
      end

      private

      def find_options_scope
        @options_scope = if options[:icon]
          [template, options]
        elsif input_html_options[:icon]
          [input, input_html_options]
        elsif label_html_options[:icon]
          [label, label_html_options]
        else
          [template, options]
        end
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Icons)


