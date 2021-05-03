//
//  AddImageButtonGroup.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import Foundation

struct ButtonGroup {
    var reselectButton: Bool = false
    var addPhotoButton: Bool = false
    var takePhotoButton: Bool = true
    var uploadPhotoButton: Bool = true
}

struct ButtonObservers {
    var source: Bool?
    var openCamera: Bool?
    var existingPhotos: Bool?
}
