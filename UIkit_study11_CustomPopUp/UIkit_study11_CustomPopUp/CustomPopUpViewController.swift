//
//  CustomPopUpViewController.swift
//  UIkit_study11_CustomPopUp
//
//  Created by 정성윤 on 2023/07/21.
//

import Foundation
import UIKit

class CustomPopUpViewController : UIViewController {
    
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var SubBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    //아무것도 하지 않는다. 호출이 됨을 알려줌.
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = true
        SubBtn.layer.cornerRadius = 10
        SubBtn.layer.masksToBounds  = true
    }
    
    @IBAction func onBgClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        // 컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            // 메인에 알린다.
            subscribeBtnCompletionClosure()
        }
    }
    
    
}
