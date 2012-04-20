module ActionView::Helpers::FormTagHelper
  def extra_tags_for_form_with_melting(options)
    extra_tags_for_form_without_melting(options).sub(
      /<input[^>]*utf8[^>]*>/,
      ''
    )
  end

  alias_method_chain :extra_tags_for_form, :melting
end
