# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirects for docs-book-healthwatch

r301 %r{/metric-store/(?![\d-]+)(.*)}, "/metric-store/0-2/$1"
