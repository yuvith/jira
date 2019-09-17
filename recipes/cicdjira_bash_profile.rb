# Updating bash profile. Calling the bash profile content from files/cicdjira_bash_profile
#
cookbook_file '/home/ec2-user/.bash_profile' do
	source 'cicdjira_bash_profile'
	mode '0644'
	owner 'root'
	group 'root'
 end

#Reloading bash profile

execute 'Execute bash profile' do 
  user    'root'
  command <<-EOH
  . /home/ec2-user/.bash_profile
  EOH
end 

#Starting the Jira application

execute 'Execute my script' do 
  user    'root'
  command <<-EOH
  cd /apps/jira/server/atlassian-jira-6.4.14-standalone/bin/ /
  ./start-jira.sh
  EOH
end
