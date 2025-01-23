class DatabaseErrorHandler
  def initialize(app)
    @app = app
  end
  def call(env)
    begin
      @app.call(env)
    rescue ActiveRecord::ConnectionNotEstablished, PG::ConnectionBad => e
      Rails.logger.error "Database connection error: #{e.message}"
      return [
        503, # HTTP status for Service Unavailable
        { "Content-Type" => "text/html" },
        [File.read(Rails.root.join("public/503.html"))]
      ]
    end
  end
end