//
//  SelectedVideo.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 28/04/2021.
//

import SwiftUI
import AVKit

struct SelectedVideo: View {
    var theUrl: URL
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  theUrl))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//        VideoPlayer(player: AVPlayer(url: theUrl))
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}

//struct SelectedVideo_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedVideo()
//    }
//}


//.onTapGesture {
//  isSheetPresented = true
//  sheetMode = .video
//  player = AVPlayer(url: videos[index])
//}
