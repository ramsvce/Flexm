//
//  UserAPI.swift
//  Flexm_Project
//
//  Created by ramesh pazhanimala on 12/02/21.
//  Copyright © 2021 ramesh pazhanimala. All rights reserved.
//

import Foundation

class UserAPI {
    static func getUsers() -> [User]{
        let users = [
            
            User(username: "dove", password: "password", profileImage: "dove.jpg", emailId: "test@gmail.com"),
            User(username: "scene", password: "password", profileImage: "scene.jpg", emailId: "test@gmail.com"),
            User(username: "sun", password: "password", profileImage: "sun.jpg", emailId: "test@gmail.com"),
            User(username: "planet", password: "password", profileImage: "planet.jpg", emailId: "test@gmail.com"),
            User(username: "monkey", password: "password", profileImage: "monkey.jpg", emailId: "test@gmail.com"),
            User(username: "design", password: "password", profileImage: "hd.jpg", emailId: "test@gmail.com"),

            ]
        return users
    }
}
