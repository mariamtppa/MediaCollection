//
//  AddImageMediaImageView.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import SwiftUI

struct AddImageMediaImageView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
    }
}

//struct AddImageMediaImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddImageMediaImageView()
//    }
//}
