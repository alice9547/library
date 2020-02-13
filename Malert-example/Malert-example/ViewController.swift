//
//  ViewController.swift
//  Malert-example
//
//  Created by sogihyeon on 2020/02/13.
//  Copyright © 2020 sogihyeon. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
import Malert
import SwiftEntryKit
import FFPopup

class ViewController: UIViewController {

    lazy var alertBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setBtn()
    }


}

extension ViewController {
    func setView() {
        view.backgroundColor = .white
        view.addSubview(alertBtn)
    }
    func setBtn() {
        alertBtn.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        alertBtn.setTitle("ShowCustomAlert", for: .normal)
        alertBtn.backgroundColor = .systemGray3
        alertBtn.addTarget(self, action: #selector(tappedAlertBtn), for: .touchUpInside)
    }
    @objc func tappedAlertBtn() {
        let myview = PopupView()
        let popup = FFPopup(contentView: myview)
        popup.showType = .growIn
        popup.dismissType = .shrinkOut
        let layout = FFPopupLayout(horizontal: .center, vertical: .center)
        popup.show(layout: layout)
    }
}
