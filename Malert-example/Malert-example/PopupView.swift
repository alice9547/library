//
//  PopupView.swift
//  Malert-example
//
//  Created by sogihyeon on 2020/02/13.
//  Copyright © 2020 sogihyeon. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

class PopupView: UIView {
    
    lazy var cancel = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .red
        self.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addSubview(cancel)
        cancel.setTitle("닫기", for: .normal)
        cancel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(88)
        }
        cancel.backgroundColor = .systemTeal
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
