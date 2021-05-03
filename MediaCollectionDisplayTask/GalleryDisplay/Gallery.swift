
//  Gallery.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.


import SwiftUI

struct Gallery: View {
    @EnvironmentObject var gallery: MediaCollection
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(gallery.collection) { box in
                    if (box.isText == true) {
                        TextCell(media: box).padding(.leading, 5)
//                            .onAppear(perform: {
//                                print(gallery.collection, "mnjnknkjjkbk")
//                            })
                    } else if (box.isImage == true) {
                        ImageCell(media: box).padding(.leading, 5)
                    } else if (box.isVideo == true){
                        VideoCell(media: box).padding(.leading, 5).onAppear(perform: {
//                            print(box.theUrl, "mnjnknkjjkbk")
                        })
                    }
                }
            }
        }
    }
}

struct Gallery_Previews: PreviewProvider {
    static var previews: some View {
        Gallery()
    }
}
