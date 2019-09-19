# create_a_pgsql_directory
directory '/apps/jira/sw/pgsql' do
  owner 'root'
  group 'root'
  mode '0755'
end

# Downloading PSQL tar file and copying it to the apps/jira/sw folder
execute 'copy_psql' do
  command 'cp /downloads/postgresql-9.6.1.tar.gz /apps/jira/sw'
  user 'root'
end

# Extracting PSQL tar file
execute 'untar_psql' do
  command 'tar -xvf /apps/jira/sw/postgresql-9.6.1.tar.gz -C /apps/jira/sw'
  user 'root'
end

# Copying content to server directory
execute 'copy_postgresql-9.6.1' do
  command 'cp -avr /apps/jira/sw/postgresql-9.6.1/ /apps/jira/sw/pgsql'
  user 'root'
end
