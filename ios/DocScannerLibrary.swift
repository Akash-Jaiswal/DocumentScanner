//
//  DocumentScanner.swift
//  DocScannerLibrary
//
//  Created by akash.jaiswal on 04/12/22.
//  Copyright © 2022 Facebook. All rights reserved.
//


import Foundation
import UIKit
import  VisionKit

@objc(DocScannerLibrary)
class DocScannerLibrary: UIViewController {
  
  @objc func openCamera() {
    self.configueDocumentView()
  }
  
  private func configueDocumentView(){
    DispatchQueue.main.async {
      let scanningDocumentVC = VNDocumentCameraViewController()
      scanningDocumentVC.delegate = self
      UIApplication.shared.windows.first?.rootViewController?.present(scanningDocumentVC, animated: true, completion:nil)
    }
  }
  
  func sendEvent(_ name: String, body: [String: Any]) {
    RNEventEmitter.emitter.sendEvent(withName: name, body: body )
  }
}

extension DocScannerLibrary:VNDocumentCameraViewControllerDelegate{
  func documentCameraViewController(_ controller:VNDocumentCameraViewController,didFinishWith scan:VNDocumentCameraScan) {
    var images: [Any] = []
    for pageNumber in 0..<scan.pageCount{
      let image = scan.imageOfPage(at: pageNumber)
      images.append(image)
    }
    sendEvent("EventReminder", body: ["images": images])
    controller.dismiss(animated: true, completion: nil)
  }
  
  func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
}


@objc(RNEventEmitter)
open class RNEventEmitter: RCTEventEmitter {
  
  public static var emitter: RCTEventEmitter!
  
  override public init() {
    super.init()
    RNEventEmitter.emitter = self
  }
    
  open override func supportedEvents() -> [String]! {
    return ["EventReminder"]
  }
}
