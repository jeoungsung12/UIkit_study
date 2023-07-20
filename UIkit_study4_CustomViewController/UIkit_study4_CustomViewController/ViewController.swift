//
//  ViewController.swift
//  UIkit_study4_CustomViewController
//
//  Created by 정성윤 on 2023/07/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MainViewBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MainViewBtn.addTarget(self, action: #selector(moveToMainViewcontroller), for: .touchUpInside)
    }
    //메인화면으로 이동
    @objc fileprivate func moveToMainViewcontroller() {
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}

