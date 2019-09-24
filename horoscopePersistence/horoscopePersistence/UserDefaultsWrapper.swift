//
//  UserDefaultsWrapper.swift
//  Example
//
//  Created by David Rifkin on 9/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {

    // MARK: - singleton
    
    static let wrapper = UserDefaultsWrapper()

    // MARK: - getters
    
    func getDate() -> Date? {
        return UserDefaults.standard.value(forKey: dateKey) as? Date
    }

    func getUserName() -> String? {
        return UserDefaults.standard.value(forKey: userNameKey) as? String
    }
    
    // MARK: - setters
    
    func store(userName: String) {
         UserDefaults.standard.set(userName, forKey: userNameKey)
    }
    
    func store(date: Date){
        UserDefaults.standard.set(date, forKey: dateKey)
    }
    
    // MARK: - private keyNames
    
    private let dateKey  = "date"
    private let userNameKey = "userName"
}
