module NavigationHelpers
  def path_to(page_name)
    case page_name

    when 'the homepage'
      root_path

    when /^the ([\w ]+) page$/
      send("#{$1.gsub(/\W+/, '_')}_path")

    when /^my list of clients$/
      counselor_clients_path

    when 'my profile page'
      counselor_account_path

    when /^the (show|edit) page for that (.*)$/
      action_name, resource_name = $1, $2
      instance_variable = instance_variable_get("@#{resource_name.gsub(' ','_')}")
      url_for(controller: instance_variable.class.name.tableize, action: action_name, id: instance_variable.to_param, only_path: true)

    when /^that ([\w ]+)'s? admin page$/
      polymorphic_path([:admin, instance_variable_get("@#{$1.gsub(/\W+/, '_')}")])

    when /^"(\/.*)"/
      $1

    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World(NavigationHelpers)
