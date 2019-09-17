default['itwt_jira']['root'] = '/apps'
default['itwt_jira']['base'] = default['itwt_jira']['root'] + '/jira'
default['itwt_jira']['software_dir'] = default['itwt_jira']['base'] + '/sw'
default['itwt_jira']['pgsql'] = default['itwt_jira']['software_dir'] + '/pgsql'
default['itwt_jira']['username'] = 'jira'
default['itwt_jira']['rootname'] = 'root'
default['itwt_jira']['groupname'] = 'jira'
default['itwt_jira']['uid'] = '1098'
default['itwt_jira']['gid'] = '1098'
default['itwt_jira']['default_mode'] = '0755'
default['itwt_jira']['skip_cookbook'] = false
default['itwt_jira']['repo_user'] = 'srvcChefNexus'

default['itwt_jira']['home'] = default['itwt_jira']['base'] + '/server'
default['itwt_jira']['jira_data'] = default['itwt_jira']['home'] + '/jira_data'
default['itwt_jira']['scripts_dir'] = default['itwt_jira']['home'] + '/bin'

default['itwt_jira']['ppmusername'] = 'ppmuser'
default['itwt_jira']['ppmgroupname'] = 'ppmuser'

