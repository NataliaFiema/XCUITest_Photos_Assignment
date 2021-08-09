//
//  AllPhotosPage_Tests.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import XCTest

class AllPhotosPage_Tests: BaseTest {
    
    lazy var basePage = BasePage(app)
    lazy var whatsNewInPhotosPage = WhatsNewPage_Functions(app)
    lazy var allPhotosPage = AllPhotosPage_Functions(app)
    lazy var detailsPhotoPage = PhotoDetailsPage_Functions(app)

    func testDeletePhotoUsingSelectOption() throws {
        //Verify if this is a first lauch of app and if there are photos to delete
        whatsNewInPhotosPage.closeWhatsNewInPhotosScreen().verifyIfPhotosAreAvailableInApp()
        
        //identify photo to delete and select
        let selectedPhoto = allPhotosPage.navigateToSelectPhotosView().selectRandomPhoto()
        let selectedPhotoTitle = allPhotosPage.getLabelOfElement(element: selectedPhoto)
        let photosBeforeDelete = allPhotosPage.getListOfPhotos()
        let photosBeforeDeleteTitles = basePage.getListOfLabels(arrayOfElements: photosBeforeDelete)
        allPhotosPage.confirmPhotoSelection(element: selectedPhoto)
        
        //delete photo chosen in previous section
        allPhotosPage.deletePhoto()
        
        //verify if photo was deleted
        let photosAfterDelete = basePage.getListOfLabels(arrayOfElements: allPhotosPage.getListOfPhotos())
        XCTAssertTrue(photosAfterDelete.count == photosBeforeDelete.count-1, "Number of found photos: \(photosAfterDelete.count) but should be: \(photosBeforeDelete.count-1)")
        
        let duplicates = basePage.getNumberOfDuplicatedTitlesThatMatchSelectedTitle(titles: photosBeforeDeleteTitles, matchingTitle: selectedPhotoTitle)
        if duplicates == 0 {
            XCTAssertFalse(photosAfterDelete.contains(selectedPhotoTitle), "Picture: \(selectedPhotoTitle) is still displayed.")
        }
        else {
            let duplicatedAfterDelete = basePage.getNumberOfDuplicatedTitlesThatMatchSelectedTitle(titles: photosAfterDelete, matchingTitle: selectedPhotoTitle)
            XCTAssertTrue(duplicatedAfterDelete == duplicates-1, "Picture is not deleted. Number of photos before: \(duplicates), number of photos after: \(duplicatedAfterDelete)")
        }
    }
    
    func testDeletePhotoWithoutSelect() throws {
        //Verify if this is a first lauch of app and if there are photos to delete
        whatsNewInPhotosPage.closeWhatsNewInPhotosScreen().verifyIfPhotosAreAvailableInApp()
        
        //Select photo to delete
        let selectedPhoto = allPhotosPage.selectRandomPhoto()
        let selectedPhotoTitle = allPhotosPage.getLabelOfElement(element: selectedPhoto)
        let photosBeforeDelete = allPhotosPage.getListOfPhotos()
        let photosBeforeDeleteTitles = basePage.getListOfLabels(arrayOfElements: photosBeforeDelete)
        allPhotosPage.confirmPhotoSelection(element: selectedPhoto)
        
        let photosAfterDelete = detailsPhotoPage
                                            .closeExploreTipIfDisplayed()
                                            .deletePhoto()
                                            .goBackToAllPhotoScreen()
                                            .getListOfPhotos()
        
        XCTAssertTrue(photosBeforeDelete.count - 1 == photosAfterDelete.count, "Number of photos after deleting one is not correct. Expected number: \(photosBeforeDelete.count - 1) but found: \(photosAfterDelete.count)")
        
        let photosAfterDeleteTitles = basePage.getListOfLabels(arrayOfElements: photosAfterDelete)
       
        let duplicates = basePage.getNumberOfDuplicatedTitlesThatMatchSelectedTitle(titles: photosBeforeDeleteTitles, matchingTitle: selectedPhotoTitle)
        if duplicates == 0 {
            XCTAssertFalse(photosAfterDeleteTitles.contains(selectedPhotoTitle), "Picture: \(selectedPhotoTitle) is still displayed.")
        }
        else {
            let duplicatedAfterDelete = basePage.getNumberOfDuplicatedTitlesThatMatchSelectedTitle(titles: photosAfterDeleteTitles, matchingTitle: selectedPhotoTitle)
            XCTAssertTrue(duplicatedAfterDelete == duplicates-1, "Picture is not deleted. Number of photos before: \(duplicates), number of photos after: \(duplicatedAfterDelete)")
        }
    }

}
