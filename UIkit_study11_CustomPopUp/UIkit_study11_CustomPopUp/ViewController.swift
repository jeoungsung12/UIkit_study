//
//  ViewController.swift
//  UIkit_study11_CustomPopUp
//
//  Created by 정성윤 on 2023/07/21.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var MyWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onCreatePopUpBtnClicked(_ sender: Any) {
        print("viewController - onCreatePopUpBtnClicked) called")
        
        //스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        //스토리보드를 통해 뷰 컨트롤러 가져오기
        let alertPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        
        //뷰컨트롤러가 보여지는 스타일
        alertPopUpVC.modalPresentationStyle = .overCurrentContext
        
        //뷰컨트롤러가 사라지는 스타일
        alertPopUpVC.modalTransitionStyle = .crossDissolve

        //컴플레션 블럭이 호출되었다.
        alertPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다")
            let mychannerlUrl = URL(string: "https://www.youtube.com/watch?v=RSGfF0qMf4o&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=20")
            self.MyWebView.load(URLRequest(url: mychannerlUrl!))
        }
        
        self.present(alertPopUpVC, animated: true, completion: nil)
    }
    
}

