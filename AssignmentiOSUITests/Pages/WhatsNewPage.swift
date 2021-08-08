//
//  WhatsNewPage.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import Foundation
import XCTest

class WhatsNewPage_Elements: BasePage {
    lazy var whatsNewInPhotosText = app.staticTexts["What’s New in Photos"]
    
    lazy var continueButton = app.buttons["Continue"]
}

class WhatsNewPage_Functions: WhatsNewPage_Elements {
    
    func closeWhatsNewInPhotosScreen() -> AllPhotosPage_Functions {
        if whatsNewInPhotosText.exists {
            continueButton.tap()
        }
        return AllPhotosPage_Functions(app)
    }
}
