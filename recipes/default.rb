#
# Cookbook Name:: jira
# Recipe:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.
include_recipe 'jira::install-jira'
include_recipe 'jira::install-psql'
include_recipe 'jira::cicdjira_bash_profile'
include_recipe 'jira::ssl'
include_recipe 'jira::post-installation'
