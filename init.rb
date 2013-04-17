require 'default_assign_issue_patch'
require 'default_assign_project_patch'
require 'default_assign/hooks/default_assign_projects_hooks'

Rails.configuration.to_prepare do
  unless Project.included_modules.include? DefaultAssignProjectPatch
    require_dependency 'project'
    Project.send(:include, DefaultAssignProjectPatch)
  end
  unless Issue.included_modules.include? DefaultAssignIssuePatch
    require_dependency 'issue'
    Issue.send(:include, DefaultAssignIssuePatch)
  end
end

Redmine::Plugin.register :redmine_default_assign do
  name 'Default Assign plugin'
  author 'Robert Chady'
  description 'Plugin implementing Douglas Campos\' ticket-482 code as a plugin'
  version '0.2.0'

  settings :default => {'default_assignee_id' => nil}, :partial => 'settings/default_assign'

end
