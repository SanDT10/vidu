//
//  User.swift
//  Lesson15
//
//  Created by SAN10 on 3/18/22.
//

import Foundation
class User {
    var id = ""
    var email = ""
    init(dict : [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        
    }
}
