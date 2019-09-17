#PPM Account

# This block will update the ppm user if it does not exist

user 'create ppm user if it does not exist' do
  comment 'ppm user'
  username node['itwt_jira']['ppmusername']
  home node['itwt_jira']['root']
  shell '/bin/bash'
  action :create
end

# Creates (if non-existing) or updates (if non-matching) group

group 'create ppm group if not existing' do
  group_name node['itwt_jira']['ppmgroupname']
  members node['itwt_jira']['ppmusername']
  action :create
end



directory "#{node['itwt_jira']['root']}/feeds/hpppm" do
    owner node['itwt_jira']['ppmusername']
    group node['itwt_jira']['ppmgroupname']
    mode node['itwt_jira']['default_mode']
	recursive true
end
