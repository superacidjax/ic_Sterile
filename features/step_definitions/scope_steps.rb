module SectionLocator

  def within_parent(content, elements = ['*'], &block)
    expr = %(//*[(#{elements.join('|')})/descendant-or-self::*[contains(., "#{content}")]])
    within(:xpath, expr) { block.call }
  end

  def within_parent_preceding(content, elements = ['*'], &block)
    expr = %(//*[(#{elements.join('|')})[contains(., "#{content}")]]/..)
    within(:xpath, expr) { block.call }
  end

end

World(SectionLocator)

sections = %w(hgroup nav h1 h2 h3 h4 h5 h6 legend caption dt strong p)

When /^(.*) in the "([^\"]*)" section$/ do |action, title|
  within_parent(title, sections) do
    step action
  end
end

When /^(.*) in the "([^\"]*)" section:$/ do |action, title, table|
  within_parent(title, sections) do
    step "#{action}:", table
  end
end

When /^(.*) in the "([^\"]*)" row$/ do |action, title|
  within_parent(title, %w(th td)) do
    step action
  end
end

When /^(.*) in the section before "([^\"]*)"/ do |action, title|
  within_parent_preceding(title, sections) do
    step action
  end
end
