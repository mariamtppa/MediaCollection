//
//  AddImageMediaView.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import SwiftUI

struct AddImageMediaView: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay = false
    @State var buttonGroup: ButtonGroup
    @State var buttonObservers: ButtonObservers
    
    var body: some View {
        ZStack{
            Color("MainBackgroundColor")
            VStack {
                if (selectedImage != nil) {
                    AddImageMediaImageView(image: Image(uiImage: selectedImage ?? UIImage()))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .padding(.bottom, 15)
                }
                if ( buttonGroup.addPhotoButton == true) {
                    CustomButton (
                        buttonText: "Add photo",
                        buttonClosure: {
                            let newMedia = MediaData(isText: false, isImage: true, imageData: selectedImage?.jpegData(compressionQuality: 0.8), textMesssage: nil)
                            mediaCollection.addToMedia(newMedia)
                            presentationMode.wrappedValue.dismiss()
                        }
                    )
                }
                if (buttonObservers.source == false) && (buttonGroup.reselectButton == true) {
                    CustomButton(
                        buttonText: "Reselect Photo", buttonClosure: {
                            if buttonObservers.openCamera == true {
                                self.buttonObservers.source = true
                            } else if (buttonObservers.existingPhotos == true) {
                                self.buttonObservers.source = false
                            }
                            self.isImagePickerDisplay = true
                        })
                }
                if (buttonGroup.takePhotoButton == true) {
                    CustomButton(
                        buttonText: "Take Photo",
                        buttonClosure: {
                            buttonObservers.source = true
                            buttonObservers.openCamera = true
                            self.isImagePickerDisplay = true
                        })
                }
                if (buttonGroup.uploadPhotoButton == true) {
                    CustomButton(
                        buttonText: "Upload Photo",
                        buttonClosure: {
                            buttonObservers.source = false
                            buttonObservers.existingPhotos = true
                            self.isImagePickerDisplay = true
                        })
                }
                
            }
            .sheet(isPresented: self.$isImagePickerDisplay) {
                if buttonObservers.source == true {
                    ImagePickerView(buttonGroup: $buttonGroup, selectedImage: self.$selectedImage, sourceType: .camera)
                } else {
                    ImagePickerView(buttonGroup: $buttonGroup, selectedImage: self.$selectedImage, sourceType: .photoLibrary)
                }
            }
        }}
}

