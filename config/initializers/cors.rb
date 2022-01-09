Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://shop.a.com'
    resource '/token', headers: :any, methods: %i[get]
  end
end
