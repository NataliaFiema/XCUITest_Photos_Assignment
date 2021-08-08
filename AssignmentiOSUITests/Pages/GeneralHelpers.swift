//
//  GeneralHelpers.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import Foundation
import XCTest

class GeneralHelpersPage: BasePage {
    
    //Returns random number, min value included, max value excluded
    func randomNumber(min: Int, max: Int) -> Int{
        return Int.random(in: min..<max)
    }
}
