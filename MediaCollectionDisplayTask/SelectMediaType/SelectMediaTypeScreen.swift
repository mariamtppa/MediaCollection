//
//  SelectMediaType.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

struct SelectMediaTypeScreen: View {
    var body: some View {
        VStack {
            CustomButton(buttonText: "Add Text", buttonClosure: {
                            addTextScreen = true
                            presentationMode.wrappedValue.dismiss()
                
            }
            )
            CustomButton(buttonText: "Add Image", buttonClosure: {})
            CustomButton(buttonText: "Add Video", buttonClosure: {})
        }
    }
}

struct SelectMediaTypeScreen_Previews: PreviewProvider {
    static var previews: some View {
        SelectMediaTypeScreen()
    }
}
