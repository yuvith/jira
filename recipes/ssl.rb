#Cloning the ssl directory

execute 'copy_ssl directory' do
    command 'cp -r /apps/jira/ssl /apps/jira/ssl_clone'
    user 'root'
end

#Copying the jks file to original ssl directory

execute 'copy_jks file to ssl directory' do
    command 'cp /apps/jira/cvjrad0004.dtcc.com.jks /apps/jira/ssl'
    user 'root'
end


#cloning server.xml file

execute 'copy_/conf/server.xml' do
    command 'cp /apps/jira/server/atlassian-jira-6.4.14-standalone/conf/server.xml /apps/jira/server/atlassian-jira-6.4.14-standalone/conf/server_clone.xml'
    user 'root'
end

#Modifying the server.xml using template

template '/apps/jira/server/atlassian-jira-6.4.14-standalone/conf/server.xml' do
	source 'server.xml.erb'
	action :create
end


#Modifying the setenv.sh script

execute 'copy_setenv.sh' do
  command 'cp /apps/jira/server/atlassian-jira-6.4.14-standalone/bin/setenv.sh /apps/jira/server/atlassian-jira-6.4.14-standalone/bin/setenv_clone.sh'  
  user 'root'
end

template '/apps/jira/server/atlassian-jira-6.4.14-standalone/bin/setenv.sh' do
 variables(
  :jvm_min => '384m',
  :jvm_max => '768m',
  :disable_notify => '#'
 )
 source 'setenv.sh.erb'
 action :create
end

