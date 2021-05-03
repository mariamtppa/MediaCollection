//
//  CameraViewForVideoRecording.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 30/04/2021.
//
import Foundation
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = CameraViewController
    private let cameraViewController: CameraViewController
    
    init() {
        cameraViewController = CameraViewController()
    }
    
    func makeUIViewController(context: Context) -> CameraViewController {
        cameraViewController
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        
    }
    
    public func switchCamera() {
        cameraViewController.switchCamera()
    }
    
    public func startRecording() {
        cameraViewController.captureMovie()
    }
    
    public func stopRecording() {
        cameraViewController.stopRecording()
    }
    
    public func getUrl() -> URL? {
//        print(cameraViewController.tempURL)
        if let newUrl = cameraViewController.tempURL {
            return newUrl
        }
        return nil
    }
}
