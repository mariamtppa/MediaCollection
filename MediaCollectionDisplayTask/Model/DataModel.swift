//
//  DataModel.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import Foundation
import Combine

class MediaCollection: ObservableObject{
    @Published var collection = [MediaData]()
    @Published var deletedItem = MediaData()
    @Published var selectedCell = MediaData()
    @Published var videos = [URL]()
    
    func addToMedia(_ newMedia: MediaData) {
        collection.append(newMedia)
    }
    
    private var itemToDelete: Int? {
        collection.firstIndex(where: { $0.id == deletedItem.id })
    }
    func removeCell() {
        if let itemToDelete = itemToDelete {
            collection.remove(at: itemToDelete)
        }
    }
}
