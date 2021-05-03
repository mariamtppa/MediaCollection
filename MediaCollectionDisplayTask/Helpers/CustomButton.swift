//
//  MediaTypeButton.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

struct CustomButton: View {
    var buttonText: String
    var buttonClosure: () -> ()
    var body: some View {
        Button(action: buttonClosure, label: {
            Text(buttonText)
                .bold()
                .frame(width: 280, height: 50)
                .background(Color("CustomButtonBackground"))
                .foregroundColor(Color("CustomButtonTextAndBorder"))
                .cornerRadius(10)
                .padding(.bottom, 15)
        })
    }
}

//struct CustomButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButton()
//    }
//}
