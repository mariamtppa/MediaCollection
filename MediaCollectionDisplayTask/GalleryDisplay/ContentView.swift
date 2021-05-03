//
//  ContentView.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI
import AVKit


struct ContentView: View {
    @State private var showSelectMediaTypeScreen = false
    @State private var showAddTextScreen = false
    @State private var showAddImageScreen = false
    @State private var showAddVideoScreen = false
    @EnvironmentObject var mediaCollection: MediaCollection
//    @State var video = [URL]()
    
    var body: some View {
        ZStack {
            Color("MainBackgroundColor").ignoresSafeArea()
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
                                .resizable()
                                .frame(width: 24, height: 24)
                                .background(Color("AddMediaTypeButtonBackground"))
                                .clipShape(Circle())
                                .foregroundColor(Color("AddMediaTypeButtonText"))
                                .cornerRadius(30)
                                .padding(3)
                        })
                    }
                    .padding(10)
                    
                    NavigationLink(destination: AddTextMediaView( textEditorMessage: ""), isActive: $showAddTextScreen) {
                        EmptyView()
                    }
                    NavigationLink(destination: AddImageMediaView(buttonGroup: ButtonGroup(), buttonObservers: ButtonObservers()), isActive: $showAddImageScreen) {
                        EmptyView()
                    }
                    NavigationLink(destination: AddVideoScreen(dismissScreen: $showAddVideoScreen), isActive: $showAddVideoScreen) {
                        EmptyView()
                    }
                }
            }
            .sheet(isPresented: $showSelectMediaTypeScreen) {
                SelectMediaTypeScreen(showAddTextScreen: $showAddTextScreen, showAddImageScreen: $showAddImageScreen, showAddVideoScreen: $showAddVideoScreen)
            }
            .accentColor(Color("NavigationTextAndIcon"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var selectedCell = MediaCollection().collection[0]
    static var previews: some View {
        ContentView()
    }
}
