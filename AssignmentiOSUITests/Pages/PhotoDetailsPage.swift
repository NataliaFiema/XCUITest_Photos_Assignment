//
//  PhotoDetailsPage.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import Foundation
import XCTest

class PhotoDetailsPage_Elements: BasePage {
    
    lazy var photoName = app.navigationBars.children(matching: .other).firstMatch
    
    lazy var allPhotosButton = app.buttons["All Photos"]
    lazy var gotItButton = app.buttons["Got It"]
    
    lazy var explorePopUp = app.staticTexts["Explore"]
}

class PhotoDetailsPage_Functions: PhotoDetailsPage_Elements {
    
    func goBackToAllPhotoScreen() -> AllPhotosPage_Functions {
        allPhotosButton.tap()
        return AllPhotosPage_Functions(app)
    }
    
    func returnCurrentPhotoTitle() -> String {
        return photoName.label
    }
    
    func closeExploreTipIfDisplayed() -> Self {
        do{
            try tryToWaitForElement(timeout: 2)
        }
        catch {}
        
        if explorePopUp.exists {
            gotItButton.tap()
        }
        return self
    }
    
    func tryToWaitForElement(timeout: TimeInterval) throws {
        let result = explorePopUp.waitForExistence(timeout: timeout)
        if result == false {
            throw MyError.ElementDoesNotExist(description: "Explore Tip does not exist.")
        }
    }
    
    func deletePhoto() -> Self {
        let allPhotoPage = AllPhotosPage_Functions(app)
        allPhotoPage.deletePhoto()
        return self
    }
}
