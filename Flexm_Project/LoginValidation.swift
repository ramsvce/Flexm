//
//  LoginValidation.swift
//  Flexm_Project
//
//  Created by ramesh pazhanimala on 12/02/21.
//  Copyright © 2021 ramesh pazhanimala. All rights reserved.
//

import Foundation

class LoginValidation: NSObject {

var user: User!

var username: String {
    return user.username!
}
var password: String {
    return user.password!
}

typealias authenticationLoginCallBack = (_ status:Bool, _ message:String) -> Void
var loginCallback:authenticationLoginCallBack?

func authenticateUser(_ username:String, andPassword password:String) {
    if username.count  != 0 {
        if password.count != 0 {
            self.verifyUser(username, andPassword: password)
        } else {
            self.loginCallback?(false, "Password should not be empty")
        }
    } else {
        self.loginCallback?(false, "Username should not be empty")
    }
}


  func verifyUser(_ username:String, andPassword password:String) {
    if username.lowercased() == "user" && password.lowercased() == "password" {
        user = User(username: username, password: password, profileImage: "", emailId: "")
        self.loginCallback?(true, "User is successfully authenticated")
    } else {
        self.loginCallback?(false, "Please enter valid credentials")
    }
}

func loginCompletionHandler(callBack: @escaping authenticationLoginCallBack) {
    self.loginCallback = callBack
}

}
