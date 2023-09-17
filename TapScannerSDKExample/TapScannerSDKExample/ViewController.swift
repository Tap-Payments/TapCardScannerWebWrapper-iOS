//
//  ViewController.swift
//  TapScannerSDKExample
//
//  Created by Osama Rabie on 17/09/2023.
//

import UIKit
import TapCardScannerWebWrapper_iOS
import TapCardVlidatorKit_iOS
import SharedDataModels_iOS
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    lazy var tapInlineScanner:TapInlineCardScanner = .init(dataSource:self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tapInlineScanner.delegate = self
        
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                //access granted
                DispatchQueue.main.async {
                    do{
                        try self.tapInlineScanner.startScanning(in: self.previewView, scanningBorderColor: .green, blurBackground: true,showTapCorners: true, timoutAfter: -1)
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }else {
                
            }
        }
        
       
        
        //view.bringSubviewToFront(previewView)
    }

}


extension ViewController:TapScannerDataSource,TapInlineScannerProtocl {
    func allowedCardBrands() -> [CardBrand] {
        return CardBrand.allCases
    }
    
    func tapFullCardScannerDimissed() {
        
    }
    
    func tapCardScannerDidFinish(with tapCard: TapCard) {
        
    }
    
    func tapInlineCardScannerTimedOut(for inlineScanner: TapInlineCardScanner) {
        
    }
    
    
}

