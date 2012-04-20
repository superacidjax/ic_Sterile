module FancyFormHelper
  def fancy_form_for(*args, &block)
    options = args.extract_options!
    form_for(*args + [options.merge(:builder => FancyFormBuilder)], &block)
  end

  class FancyFormBuilder < ActionView::Helpers::FormBuilder

    def error_message_on(attribute)
      error = object.errors[attribute].first
      content_tag(:span, error, :class => 'field_error') if error
    end

    def error_class_on(attribute)
      'error' if error_message_on(attribute)
    end

    def label_with_error(attribute, *args)
      label = label(attribute, *args)
      if message = error_message_on(attribute)
        label.sub(%r{</label>}) do
          %Q< #{error_message_on(attribute)}</label>>
        end.html_safe
      else
        label
      end
    end

    def dl_input(type, field, *args, &block)
      content_tag :dl, :class => ('error_field' if error_message_on(field)) do
        content_tag(:dt, label_with_error(field)) +
          content_tag(:dd, [send(type, field, *args), capture_string(&block)].compact.join(' ').html_safe)
      end
    end

    def article(title, &block)
      builder = ArticleBuilder.new(self)
      output = capture_string { yield builder }
      errors = builder.error_messages
      content_tag :article, :class => ('error' if builder.error_messages.present?) do
        content_tag(:h1, title) + errors + output
      end
    end

    def check_box_list(attribute)
      attribute_array = object.send(attribute) || []
      content_tag :ul do
        Object.const_get(attribute.upcase).map do |option|
          content_tag :li do
            content_tag :label do
              checked = attribute_array.include?(option)
              @template.check_box_tag("#{object_name}[#{attribute}][]", option, checked) <<
                " " << @template.t("#{attribute}.#{option}")
            end
          end
        end.inject(&:+)
      end
    end

    def check_box_list_with_other(attribute)
      check_box_list(attribute) +
        label_with_error(:"other_#{attribute}", "Other:") +
        text_area(:"other_#{attribute}", :rows => 5, :cols => 40) +
        content_tag(:p, "(Separate by Commas)")
    end

    delegate :content_tag, :to => :@template

    def capture_string(&block)
      (@template.capture(&block) if block_given?).to_s
    end
  end

  class ArticleBuilder

    def initialize(form)
      @form, @fields = form, []
    end

    attr_reader :form

    def fields
      @fields.uniq
    end

    def method_missing(method, *args, &block)
      @fields << args.first if input_method?(method)
      form.send(method, *args, &block)
    end

    def error_messages
      fields.select {|f| error_message_on(f)}.map { |f| mark_up_error(f) }.join.html_safe
    end

    def input_method?(method)
      method.to_s =~ /_(field|select)$/ || %w(radio_button check_box select).include?(method.to_s)
    end

    protected
    def mark_up_error(field)
      content_tag :p, :class => 'error' do
        field.to_s.humanize + ' ' + object.errors[field].first
      end
    end
  end
end
