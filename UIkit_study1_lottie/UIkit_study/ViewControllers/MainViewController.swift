//
//  ViewController.swift
//  UIkit_study
//
//  Created by 정성윤 on 2023/07/03.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Main screen"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView: LottieAnimationView = {
        let aniView = LottieAnimationView(name : "148188-a-ghost")
        aniView.frame = CGRect(x:0, y:0, width: 400, height: 400) //크기 사각형 만들기
        aniView.contentMode = .scaleAspectFill //이미지 확대 축소
        return aniView
    }()
    
    // 뷰가 생성되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        //애니메이션 실행
        animationView.play{ (finish) in //애니메이션이 종료가 되면
            print("애니메이션이 끝났다.")
            self.view.backgroundColor = .white //클로져 안에서는 self 해줘야함
            
            self.animationView.removeFromSuperview()
            //애니메이션 뷰의 상위 부모가 뷰. 애니메이션 뷰의 super는 뷰. 애니메이션이 끝나면 부모에서 자체 삭제
            //다른 뷰를 subview 추가
            
            self.view.addSubview(self.titleLabel)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false //설정 안하면 아래 액티브 적용 불가
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
    }
}
