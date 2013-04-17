class DefaultAssignProjectHook < Redmine::Hook::ViewListener
 
  # context:
  # * :form - the form builder
  # * :project - the current project
  def view_projects_form(context={})
 
    return content_tag(:p,
		context[:form].select(:default_assignee_id,  context[:project].assignable_users.collect {|user| [user.name, user.id]}, {:include_blank => :none}))
 
  end
end
