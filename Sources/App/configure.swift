import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    //app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.views.use(.leaf)
    app.databases.use(.postgres(hostname: "localhost",
                                username: "postgres",
                                password: "vaporauth",
                                database: "VaporAuth"), as: .psql)
    
    app.migrations.add(User.Migration(), to: .psql)
    app.migrations.add(UserToken.Migration(), to: .psql)
    
    // register routes
    try routes(app)
}
