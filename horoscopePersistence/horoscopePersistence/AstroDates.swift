//
//  AstroDates.swift
//  horoscopePersistence
//
//  Created by Sam Roman on 9/24/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation

//enum HoroscopeDates {
//    case Aries
//    case Taurus
//    case Gemini
//    case Cancer
//    case Leo
//    case Virgo
//    case Scorpio
//    case Sagittarius
//    case Capricorn
//    case Aquarius
//    case Pisces
//
//}

struct AstroDates {

    static func getSign(month: Int, day: Int) -> String {
        switch month {
        case 1:
            if day > 20 { return "aquarius" } else { return "capricorn" }
        case 2:
            if day > 19 { return "pisces"} else { return "aquarius" }
        case 3:
        if day > 19 { return "aries"} else { return "pisces" }
        case 4:
               if day > 19 { return "taurus"} else { return "aries" }
        case 5:
        if day > 21 { return "gemini"} else { return "taurus" }
        case 6:
        if day > 21 { return "cancer"} else { return "gemini" }
        case 7:
        if day > 22 { return "leo" } else { return "cancer" }
        case 8:
        if day > 22 { return "virgo" } else { return "leo" }
        case 9:
        if day > 22 { return "libra" } else { return "virgo" }
        case 10:
        if day > 23 { return "scorpio" } else { return "libra" }
        case 11:
        if day > 22 { return "saggitarius" } else { return "scorpio" }
        case 12:
        if day > 22 { return "capricorn" } else { return "saggitarius" }
        default: return "aries"
        
    
       
            
        
    }
    }

}
