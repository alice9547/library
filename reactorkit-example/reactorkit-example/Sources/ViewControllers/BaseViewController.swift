//
//  BaseViewController.swift
//  reactorkit-example
//
//  Created by sogihyeon on 2020/04/20.
//  Copyright © 2020 statios. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import ReactorKit

class BaseViewController: UIViewController {

    // MARK: - Initializing

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder: NSCoder) {
        self.init()
    }

    // MARK: - Rx

    var disposeBag = DisposeBag()

    // MARK: - Layout Constraints

    private(set) var didSetupConstraints = false

    override func viewDidLoad() {
        self.view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

    func setupConstraints() {
        // Override point
    }

}
