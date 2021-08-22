//
//  AllPhotosPage.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import Foundation
import XCTest

class AllPhotosPage_Elements: BasePage {
    
    lazy var selectButton = app.buttons["Select"]
    lazy var cancelButton = app.buttons["Cancel"]
    lazy var deleteButton = app.buttons["Delete"]
    lazy var confirmDeletetionButton = app.buttons["Delete Photo"]
    
    lazy var photos = app.collectionViews["PhotosGridView"].children(matching: .cell)
    
    lazy var noPhotosOrVideosText = app.staticTexts["No Photos or Videos"]
}

class AllPhotosPage_Functions: AllPhotosPage_Elements {
    
    func verifyIfPhotosAreAvailableInApp() {
        if noPhotosOrVideosText.exists {
            XCTFail("No photos to delete.")
        }
    }
    
    func navigateToSelectPhotosView() -> Self {
        selectButton.tap()
        return self
    }
    
    func selectRandomPhoto() -> XCUIElement{
        let arrPhotos = photos.allElementsBoundByAccessibilityElement
        let randomIndex = randomNumber(min: 0, max: arrPhotos.count)
        let selectedPhoto: XCUIElement = arrPhotos[randomIndex]
        return selectedPhoto
    }
    
    @discardableResult func confirmPhotoSelection(element: XCUIElement) -> Self {
        element.tap()
        return self
    }
    
    func getListOfPhotos() -> [XCUIElement] {
        return photos.allElementsBoundByAccessibilityElement
    }
    
    func deletePhoto() {
        deleteButton.tap()
        confirmDeletetionButton.tap()
    }
}
