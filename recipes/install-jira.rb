#
#Cookbook Name:: itwt_jira
#Recipe:: install
#
#Copyright:: 2019,DTCC ITWT Chef Administrators, All Rights Reserved.

#Jira Application installation- Steps followed from the Jira installation document.


# This block will update the jira user if it does not exist

user 'create jira user if it does not exist' do
  comment 'Jira user'
  username node['itwt_jira']['username']
  home node['itwt_jira']['root']
  shell '/bin/bash'
  action :create
end

# Creates (if non-existing) or updates (if non-matching) group

group 'create jira group if not existing' do
  group_name node['itwt_jira']['groupname']
  members node['itwt_jira']['username']
  action :create
end

#Creating the software directory

%w[ #{node['itwt_jira']['root']} #{node['itwt_jira']['base']} #{node['itwt_jira']['software_dir']} ].each do |path|
  directory path do
    owner node['itwt_jira']['username']
    group node['itwt_jira']['groupname']
    mode node['itwt_jira']['default_mode']
  end
end

## Creating the server directory and data folder

%w[ #{node['itwt_jira']['home']} #{node['itwt_jira']['jira_data']} ].each do |path|
   directory path do 
    owner node['itwt_jira']['username']
    group node['itwt_jira']['groupname']
    mode node['itwt_jira']['default_mode']
  end
end

##Downloading Jira tar file and copying it to the apps/jira/sw folder

execute 'copy_jira' do
    command "cp /downloads/atlassian-jira-6.4.14.tar.gz node['itwt_jira']['software_dir']"
    user node['itwt_jira']['rootname']
end


##Extracting jira tar file and Copying content to server directory

execute 'untar_jira' do
	command "tar -xvf #{node['itwt_jira']['software_dir']}/atlassian-jira-6.4.14.tar.gz -C #{node['itwt_jira']['home']}"
	user node['itwt_jira']['rootname']
end

#Updating jira.home file 	

template "#{node['itwt_jira']['home']}/atlassian-jira-6.4.14-standalone/atlassian-jira/WEB-INF/classes/jira-application.properties" do
	source 'jira-application.properties.erb'
	action :create
end


