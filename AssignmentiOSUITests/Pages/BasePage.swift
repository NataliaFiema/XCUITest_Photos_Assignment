//
//  BasePage.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import Foundation
import XCTest

class BasePage {
    var app: XCUIApplication
    
    required init(_ app:XCUIApplication){
        self.app = app
    }
    
    //------------------------------------------------------------------
    //                      Common Helpers
    //------------------------------------------------------------------
    enum MyError: Error {
        case ElementDoesNotExist(description: String)
    }

    func randomNumber(min: Int, max: Int) -> Int {
        return Int.random(in: min..<max)
    }
    
    func getLabelOfElement(element: XCUIElement) -> String {
        return element.label
    }
    
    func getListOfLabels(arrayOfElements: [XCUIElement] ) -> [String] {
        var labels = [String]()
        for element in arrayOfElements {
            labels.append(element.label)
        }
        return labels
    }
    
    func getNumberOfDuplicatedTitlesThatMatchSelectedTitle(titles: [String], matchingTitle: String) -> Int {
        var numberOfDuplicatedTitles = 0;
        
        for title in titles {
            if title == matchingTitle {
                numberOfDuplicatedTitles = numberOfDuplicatedTitles+1
            }
        }
        
        return numberOfDuplicatedTitles
    }
}
