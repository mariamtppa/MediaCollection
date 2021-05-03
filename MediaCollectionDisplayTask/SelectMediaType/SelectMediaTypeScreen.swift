//
//  SelectMediaType.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

struct SelectMediaTypeScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showAddTextScreen: Bool
    @Binding var showAddImageScreen: Bool
    @Binding var showAddVideoScreen: Bool
    
    var body: some View {
        ZStack {
            Color("MainBackgroundColor")
            VStack {
                Spacer()
                CustomButton(buttonText: "Add Text", buttonClosure: {
                    showAddTextScreen = true
                    presentationMode.wrappedValue.dismiss()
                    
                })
                CustomButton(buttonText: "Add Image", buttonClosure: {
                    showAddImageScreen = true
                    presentationMode.wrappedValue.dismiss()
                    
                })
                CustomButton(buttonText: "Add Video", buttonClosure: {
                    showAddVideoScreen = true
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}
//
//struct SelectMediaTypeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectMediaTypeScreen()
//    }
//}
