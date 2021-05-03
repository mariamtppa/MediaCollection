//
//  SeectedText.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

struct SelectedText: View {
    var text: Text
    var body: some View {
        text
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .padding(5)
            .lineLimit(nil)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct SelectedText_Previews: PreviewProvider {
    static var collection = MediaCollection().collection[1]
    static var previews: some View {
        SelectedText(text: collection.message)
    }
}
