//
//  Token.swift
//  
//
//  Created by Tarang Patel on 2021-04-28.
//

import Vapor
import Fluent

enum SessionSource: Int, Content {
    case signup
    case login
}

final class Token: Model {
    
    static let schema = "tokens"
    
    @ID(key: "id")
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "value")
    var value: String
    
    @Field(key: "source")
    var source: SessionSource
    
    @Field(key: "expires_at")
    var expiresAt: Date?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    init() {}
    
    init(id: UUID? = nil,
         userId: User.IDValue,
         token: String,
         source: SessionSource,
         expiresAt: Date?) {
        
      self.id = id
      self.$user.id = userId
      self.value = token
      self.source = source
      self.expiresAt = expiresAt
    }

}
