# NGINX - Use CORS with Multiple Domains

Put this in your `/etc/nginx/nginx.conf` file. The main thing is this block:

```nginx
map $http_origin $allow_origin {
    ~^https?://domain.com$ $http_origin;
    ~^https?://www.domain.com$ $http_origin;
    default "";
}
```

This allows you to listen to both `https://domain.com` and
`https://www.domain.com`, and then put the right origin in the
`"Access-Control-Allow-Origin"` header in these lines:

```nginx
# Simple requests
if ($request_method ~* "(GET|POST)") {
    add_header "Access-Control-Allow-Origin" $allow_origin;
}
# Preflight Requests
if ($request_method = OPTIONS ) {
    add_header "Access-Control-Allow-Origin" $allow_origin;
    add_header "Access-Control-Allow-Methods" "GET, POST, PUT, OPTIONS, HEAD";
    add_header "Access-Control-Allow-Headers" "Authorization, Origin, X-Requested-With, Content-Type, Accept, X-CSRFTOKEN";
    add_header "Access-Control-Allow-Credentials" "true";
    return 200;
}
```

Here is the whole config file.

```nginx
worker_processes 1;

events {
    worker_connections 1024;
}

http {
    map $http_origin $allow_origin {
        ~^https?://domain.com$ $http_origin;
        ~^https?://www.domain.com$ $http_origin;
        default "";
    }
    server {
        ...
        location /api/v0/ {
            proxy_pass http://blue-server:8001;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
            # Simple requests
            if ($request_method ~* "(GET|POST)") {
                add_header "Access-Control-Allow-Origin" $allow_origin;
            }
            # Preflight Requests
            if ($request_method = OPTIONS ) {
                add_header "Access-Control-Allow-Origin" $allow_origin;
                add_header "Access-Control-Allow-Methods" "GET, POST, PUT, OPTIONS, HEAD";
                add_header "Access-Control-Allow-Headers" "Authorization, Origin, X-Requested-With, Content-Type, Accept, X-CSRFTOKEN";
                add_header "Access-Control-Allow-Credentials" "true";
                return 200;
            }
        }
    }
}
```

## Reference

[SO - nginx enabling CORS for multiple subdomains](https://serverfault.com/questions/958965/nginx-enabling-cors-for-multiple-subdomains)