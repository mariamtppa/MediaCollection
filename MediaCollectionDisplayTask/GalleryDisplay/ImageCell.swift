//
//  Image.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

struct ImageCell: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @State var media: MediaData
    
    var body: some View {
        media.image
            .resizable()
            .frame(width: 70, height: 70)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
            )
            .onTapGesture {
                mediaCollection.selectedCell = media
            }
            .onLongPressGesture {
                mediaCollection.deletedItem = media
                if (mediaCollection.selectedCell.id == mediaCollection.deletedItem.id) {
                    mediaCollection.selectedCell = MediaData()
                }
                mediaCollection.removeCell()
            }
    }
}
