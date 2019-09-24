//
//  File.swift
//  horoscopePersistence
//
//  Created by Sam Roman on 9/24/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation


struct Horoscope: Codable {
    var sunsign: String
    var date: String
    var horoscope: String
    var credit: String
    var meta: Meta
    
    

}

struct Meta: Codable {
    var mood: String
    var intensity: String
    var keywords: String
}


