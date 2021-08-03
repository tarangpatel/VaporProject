//
//  File.swift
//  
//
//  Created by Tarang Patel on 2021-08-02.
//

import Vapor
import Leaf

struct IndexController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let route = routes.grouped("")
        route.get(use: index)
        route.get("login", use: login)
        route.get("register", use: register)
    }
    
    func index(req: Request) -> EventLoopFuture<View> {
        let context = TitleContext(title: "Welcome to VaporAuth")
        return req.view.render("index", context)
    }
    
    func login(req: Request) -> EventLoopFuture<View> {
        return req.view.render("index", ["title": "Login Page"])
    }
    
    func register(req: Request) -> EventLoopFuture<View> {
        return req.view.render("register")
    }
}

struct TitleContext: Encodable {
    let title: String
}
