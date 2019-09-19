# Restoring data
# Stop jira

execute 'Execute Stop jira' do
  user    'root'
  command <<-EOH
  cd /apps/jira/server/atlassian-jira-6.4.14-standalone/bin/ /
  ./stop-jira.sh
  EOH
end

# Modifying the setenv.sh script

template '/apps/jira/server/atlassian-jira-6.4.14-standalone/bin/setenv.sh' do
  variables(
    jvm_min: '12288m',
    jvm_max: '13684m',
    disable_notify: ''
  )
  source 'setenv.sh.erb'
  action :create
end
