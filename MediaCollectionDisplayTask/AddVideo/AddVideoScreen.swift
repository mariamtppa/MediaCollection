//
//  AddImageMediaView.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import SwiftUI

enum AddVideo {
    case record, upload
}

struct AddVideoScreen: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @Environment(\.presentationMode) var presentationMode
    @State private var isVideoPickerDisplay = false
    @State var addVideo: AddVideo?
    @State var video = [URL]()
    @Binding var dismissScreen: Bool
    
    var body: some View {
        ZStack {
            Color("MainBackgroundColor")
            VStack {
                CustomButton(
                    buttonText: "Record Video",
                    buttonClosure: {
                        addVideo = .record
                        self.isVideoPickerDisplay = true
                    })
                CustomButton(
                    buttonText: "Upload Video",
                    buttonClosure: {
                        addVideo = .upload
                        self.isVideoPickerDisplay = true
                    })
                
            }
            .sheet(isPresented: self.$isVideoPickerDisplay) {
                if addVideo == .upload{
                    PhotoPicker (videos: $video, dismissParentScreen: $dismissScreen)
                } else if addVideo == .record {
                    RecordVideoScreen(dismissScreen: $dismissScreen)
                }
            }
        }
    }
}
