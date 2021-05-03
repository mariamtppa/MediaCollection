
//  Video.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI
import AVKit

struct VideoCell: View {
    @EnvironmentObject var mediaCollection: MediaCollection
    @State var media: MediaData
    var player: AVPlayer {
        return AVPlayer(url: media.theUrl)
    }
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player.play()
            }
            .frame(width: 70, height: 70)
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//            .overlay(
//                RoundedRectangle(cornerRadius: 12)
//                    .stroke(Color.gray, lineWidth: 2)
//            )
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
//
//struct Video_Previews: PreviewProvider {
//    static var previews: some View {
//        Video()
//    }
//}
