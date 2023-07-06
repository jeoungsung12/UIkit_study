//
//  ViewController.swift
//  UIkit_study3_QR
//
//  Created by 정성윤 on 2023/07/06.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    @IBOutlet weak var WebView: WKWebView!
    @IBOutlet weak var QRbtn: UIButton!
    
    //QR코드 리더 뷰컨트롤러를 만들기
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    //MARK: - 오버라이드 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://www.naver.com")
        let requestObj = URLRequest(url: url!)
        WebView.load(requestObj)
        QRbtn.layer.borderWidth = 3
        QRbtn.layer.borderColor = UIColor.blue.cgColor
        QRbtn.layer.cornerRadius = 10
        QRbtn.addTarget(self, action: #selector(qrcodeReaderLanch), for: .touchUpInside)
    }
    
    //MARK - fileprivate 메소드
    //클래스 안에 사용되는 메소드
    @objc fileprivate func qrcodeReaderLanch() {
        print("MainViewController - qrcodeReaderLanch() called")
        // Retrieve the QRCode content
          // By using the delegate pattern
          readerVC.delegate = self

          // Or by using the closure pattern
          readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result)
              
              guard let scannedUrlString = result?.value else {
                  return
              }
              print("scannedUrlString : \(scannedUrlString)")
              let scannedUrl = URL(string: scannedUrlString)
              self.WebView.load(URLRequest(url : scannedUrl!))
          }

          // Presents the readerVC as modal form sheet
          readerVC.modalPresentationStyle = .formSheet
         
        //설정된 QR코드 뷰 컨트롤러를 화면에 보여준다.
          present(readerVC, animated: true, completion: nil)
    }
    //MARK - QR코드 리더 델리겟 메소드
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }
}
