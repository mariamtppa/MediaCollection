//
//  ContentView.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI
import AVKit


struct ContentView: View {
    @State var player: AVPlayer?
    @State private var showSelectMediaTypeScreen = false
    @State private var showAddTextScreen = false
    @State private var showAddImageScreen = false
    @State private var showAddVideoScreen = false
    @EnvironmentObject var mediaCollection: MediaCollection
    @State var video = [URL]()
    
    var body: some View {
        NavigationView {
            VStack {
                if (mediaCollection.selectedCell.isImage) {
                    SelectedImage(image: mediaCollection.selectedCell.image )
                }
                if (mediaCollection.selectedCell.isText) {
                    SelectedText(text: mediaCollection.selectedCell.message)
                }
                if (mediaCollection.selectedCell.isVideo) {
                    SelectedVideo(theUrl: mediaCollection.selectedCell.theUrl)
                }
                HStack {
                    Gallery()
                    Button(action: {
                        showSelectMediaTypeScreen.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(30)
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    })
                }
                .padding(10)
                
                NavigationLink(destination: AddTextMediaView( textEditorMessage: ""), isActive: $showAddTextScreen) {
                    EmptyView()
                }
                NavigationLink(destination: AddImageMediaView(buttonGroup: ButtonGroup(), buttonObservers: ButtonObservers()), isActive: $showAddImageScreen) {
                    EmptyView()
                }
                NavigationLink(destination: AddVideoScreen(), isActive: $showAddVideoScreen) {
                    EmptyView()
                }
            }
        }
        .sheet(isPresented: $showSelectMediaTypeScreen) {
            SelectMediaTypeScreen(showAddTextScreen: $showAddTextScreen, showAddImageScreen: $showAddImageScreen, showAddVideoScreen: $showAddVideoScreen)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var selectedCell = MediaCollection().collection[0]
    static var previews: some View {
        ContentView()
    }
}
