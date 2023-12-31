# in GitLab config - gitlab.rb
	
	nginx['custom_gitlab_server_config'] = "
	        # CONNECTION TO rancher-gitlab-proxy BEGIN
	        location /login/oauth/authorize {
	                proxy_pass http://0.0.0.0:80;
	        }
	        location /login/oauth/access_token {
	                proxy_pass http://0.0.0.0:80;
	        }
	        location /api/v3/user {
	                proxy_pass http://0.0.0.:80;
	        }
	        location /api/v3/teams/ {
	                proxy_pass http://0.0.0.0:80;
	        }
	        location /api/v3/search/users {
	                proxy_pass http://0.0.0.0:80;
	        }
	        # CONNECTION TO rancher-gitlab-proxy END
	"
