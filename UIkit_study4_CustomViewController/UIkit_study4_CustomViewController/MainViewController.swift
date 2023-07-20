//
//  MainViewController.swift
//  UIkit_study4_CustomViewController
//
//  Created by 정성윤 on 2023/07/10.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    //제목
    var titleLabel : UILabel = {
       let label = UILabel()
        label.text = "메인화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label
    }()
    let changeBtn : UIButton = {
        let btn = UIButton(type:  .system)
        btn.setTitle("배경색 바꾸기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        btn.addTarget(self, action: #selector(changebg), for: .touchUpInside)
        return btn
    }()
    
    var isBgOrange: Bool?
    //뷰가 생성되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isBgOrange = true
        
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeBtn)
        
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        changeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    //배경색을 바꾼다
    @objc fileprivate func changebg() {
        if isBgOrange == true {
            view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            isBgOrange = false
        } else{
            view.backgroundColor =  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            isBgOrange = true
        }
    }
}
