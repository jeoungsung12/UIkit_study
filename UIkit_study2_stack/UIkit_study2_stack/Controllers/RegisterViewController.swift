//
//  RegisterViewController.swift
//  UIkit_study2_stack
//
//  Created by 정성윤 on 2023/07/05.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 상단 네비게이션 바 부분을 숨김처리
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func onLoginViewControllerButtonClicked(_ sender: UIButton) {
        //navigationviewcontroller 를 팝한다
        self.navigationController?.popViewController(animated: true)
    }
}

