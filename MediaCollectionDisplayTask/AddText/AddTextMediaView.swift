//
//  AddTextMediaView.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import SwiftUI

struct AddTextMediaView: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @Environment(\.presentationMode) var presentationMode
    @State var textEditorMessage: String
    var body: some View {
        ZStack {
            Color("MainBackgroundColor")
            VStack {
                TextMediaEditor(textEditorMessage: $textEditorMessage)
                CustomButton(
                    buttonText: "Add text",
                    buttonClosure: {
                        let newMedia = MediaData(isText: true, isImage: false, imageData: nil, textMesssage: textEditorMessage)
                        mediaCollection.addToMedia(newMedia)
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        }
    }
}

//struct AddTextMediaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTextMediaView()
//    }
//}
