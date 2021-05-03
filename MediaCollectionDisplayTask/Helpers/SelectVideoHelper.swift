//
//  PhPicker.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import Foundation
import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = PHPickerViewController
    @EnvironmentObject var media: MediaCollection
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var videos: [URL]
    @Binding var dismissParentScreen: Bool
    
    func  makeUIViewController(context: Context) ->  PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> PickerCoordinator {
        PickerCoordinator(photoPicker: self)
    }
    
    class PickerCoordinator: PHPickerViewControllerDelegate {
        let photoPicker: PhotoPicker
        let urls = [URL]()
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
            photoPicker.videos.removeAll()
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for result in results {
                let itemProvider = result.itemProvider
                guard let typeIdentifier = itemProvider.registeredTypeIdentifiers.first,
                      let uType = UTType(typeIdentifier) else {
                    return
                }
                if uType.conforms(to: .movie) {
                    itemProvider.loadFileRepresentation(forTypeIdentifier: typeIdentifier) {url, error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            guard let videoURL = url else {return}
                            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                            guard let targetURL = documentDirectory?.appendingPathComponent(videoURL.lastPathComponent) else {
                                return
                            }
                            do {
                                if FileManager.default.fileExists(atPath: targetURL.path) {
                                    try FileManager.default.removeItem(at: targetURL)
                                }
                                try FileManager.default.copyItem(at: videoURL, to: targetURL)
                                DispatchQueue.main.async {
                                    self.photoPicker.videos.append(targetURL)
                                    let newMedia = MediaData(isText: false, isImage: false, isVideo: true, videoUrl: targetURL, imageData: nil, textMesssage: nil)
                                    self.photoPicker.media.addToMedia(newMedia)
                                }
                            }
                            catch {
                                
                            }
                        }
                    }
                }
                else {
                    print("not a movie")
                }
            }
            photoPicker.dismissParentScreen = false
            photoPicker.presentationMode.wrappedValue.dismiss()   
        }
    }
}
