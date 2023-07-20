//
//  ViewController.swift
//  UIkit_study7_CompletionBlock
//
//  Created by 정성윤 on 2023/07/17.
//

import UIKit
import KRProgressHUD
class ViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController - viewDidLoad() 호출")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            print(result)
            
            
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
        
    }
    fileprivate func sayHi(completion : @escaping(String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //메인쓰레드에서 빼내서 2초 뒤에 실행해라
            print("Hi")
            completion("하이")
        }
    }
}
