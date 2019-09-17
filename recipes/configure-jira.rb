##Updating jira.home 	
def write_file(file_name)
    file = File.open('/apps/jira/server/atlassian-jira/WEB-INF/classes/jira-application.properties', 'w')
    file.puts "jira.home = /apps/jira/server/jira_data"
    file.close
  end
puts write_file("jira-application.properties") 
