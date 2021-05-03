//
//  SelectedMedia.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

struct SelectedImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(12)
            .padding(.bottom, 30)
    }
}

struct SelectedImage_Previews: PreviewProvider {
    static var collection = MediaCollection().collection[1]
    static var previews: some View {
        SelectedImage(image: collection.image)
    }
}
