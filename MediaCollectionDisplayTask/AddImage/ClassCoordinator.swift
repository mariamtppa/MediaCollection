//
//  ClassCoordinator.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//


import UIKit
import SwiftUI
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.buttonGroup.addPhotoButton = true
        self.picker.buttonGroup.reselectButton = true
        self.picker.buttonGroup.uploadPhotoButton = false
        self.picker.buttonGroup.takePhotoButton = false
        self.picker.isPresented.wrappedValue.dismiss()
    }
}
