//
//  Text.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI
import AVKit

struct TextCell: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @State var media: MediaData
    @State var player: AVPlayer?
    
    var body: some View {
        media.message
            .padding(3)
            .frame(width: 70, height: 70)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
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
