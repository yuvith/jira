#PSQL installation.

##Create a pgsql directory
directory "#{node['itwt_jira']['software_dir']}/pgsql" do
    owner node['itwt_jira']['username']
    group node['itwt_jira']['groupname']
    mode node['itwt_jira']['default_mode']
end

##Downloading PSQL tar file and copying it to the apps/jira/sw folder

execute 'copy_psql' do
    command "cp /downloads/postgresql-9.6.1.tar.gz #{node['itwt_jira']['software_dir']}"
    user node['itwt_jira']['rootname']
end

##Extracting PSQL tar file and copying it to server directory

execute 'untar_psql' do
	command "tar -xvf #{node['itwt_jira']['software_dir']}/postgresql-9.6.1.tar.gz -C #{node['itwt_jira']['pgsql']}"
	user node['itwt_jira']['rootname']
end
