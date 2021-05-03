//
//  MediaData.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import Foundation
import SwiftUI
import AVKit

struct MediaData: Hashable, Identifiable {
    let id = UUID()
    var isText: Bool = false
    var isImage: Bool = false
    var isVideo: Bool = false
    
    var videoUrl: URL?
    var theUrl: URL{
        return videoUrl!
    }
    
    var imageData: Data?
    var image: Image {
        Image(uiImage: UIImage(data: imageData ?? Data()) ?? UIImage())
    }
    
    var textMesssage: String?
    var message: Text {
        Text(textMesssage ?? "")
    }
    
}
