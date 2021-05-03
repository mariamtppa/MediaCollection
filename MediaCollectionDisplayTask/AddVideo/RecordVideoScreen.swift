//
//  RecordVideoScreen.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 30/04/2021.
//

import SwiftUI

struct RecordVideoScreen: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @Environment(\.presentationMode) var presentationMode
    @State var isRecording = false
    var cameraView = CameraView()
    @Binding var dismissScreen: Bool
    
    var body: some View {
        VStack {
            ZStack {
                cameraView
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            cameraView.switchCamera()
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .padding()
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    HStack {
                        Button {
                            if !isRecording {
                                cameraView.startRecording()
                            } else {
                                cameraView.stopRecording()
                            }
                            isRecording.toggle()
                        } label: {
                            Image(systemName: "record.circle")
                                .font(.system(size: 60))
                                .foregroundColor(isRecording ? Color.red : Color.white)
                        }
                        Spacer()
                        Button {
//                            print(cameraView.getUrl(), "temp url from record video screen")
                            let newMedia = MediaData(isVideo: true, videoUrl: cameraView.getUrl())
                            mediaCollection.addToMedia(newMedia)
//                            print(mediaCollection.collection)
                            presentationMode.wrappedValue.dismiss()
                            dismissScreen.toggle()
                        } label: {
                            Text("save")
                                .fontWeight(.medium)
                                .font(.system(size: 30))
                                .foregroundColor(Color("RecordVideoSaveButton"))
                        }
                    }.padding()
                }
            }
        }
    }
}

//struct RecordVideoScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordVideoScreen()
//    }
//}
