//
//  ViewController.swift
//  ViewAnimator-example
//
//  Created by sogihyeon on 2020/02/05.
//  Copyright © 2020 sogihyeon. All rights reserved.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    // MARK:- Views
    lazy var entireViewButton = UIButton()
    lazy var tableViewButton = UIButton()
    lazy var collectionViewButton = UIButton()
    lazy var complexLayoutButton = UIButton()
    
    let entireVC = EntireVC()
    // MARK:- Properties
    
    // MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

// MARK:- setupui
extension ViewController {
    func setupUI() {
        _ = view.then {
            $0.backgroundColor = .white
            $0.addSubview(entireViewButton)
            $0.addSubview(tableViewButton)
            $0.addSubview(collectionViewButton)
            $0.addSubview(complexLayoutButton)
        }
        _ = entireViewButton.then {
            $0.snp.makeConstraints {
                $0.height.width.equalTo(view.frame.width/2)
                $0.bottom.equalTo(view.snp_centerYWithinMargins)
                $0.trailing.equalTo(view.snp_centerXWithinMargins)
            }
            $0.backgroundColor = .systemBlue
            $0.setTitle("Entire View", for: .normal)
            $0.addTarget(self, action: #selector(onEntireView), for: .touchUpInside)
        }
        _ = tableViewButton.then {
            $0.snp.makeConstraints {
                $0.height.width.equalTo(view.frame.width/2)
                $0.bottom.equalTo(view.snp_centerYWithinMargins)
                $0.leading.equalTo(view.snp_centerXWithinMargins)
            }
            $0.backgroundColor = .systemFill
            $0.setTitle("Table View", for: .normal)
            $0.addTarget(self, action: #selector(onTableView), for: .touchUpInside)
        }
        _ = collectionViewButton.then {
            $0.snp.makeConstraints {
                $0.height.width.equalTo(view.frame.width/2)
                $0.top.equalTo(view.snp_centerYWithinMargins)
                $0.trailing.equalTo(view.snp_centerXWithinMargins)
            }
            $0.backgroundColor = .systemTeal
            $0.setTitle("Collection View", for: .normal)
            $0.addTarget(self, action: #selector(onCollectionView), for: .touchUpInside)
        }
        _ = complexLayoutButton.then {
            $0.snp.makeConstraints {
                $0.height.width.equalTo(view.frame.width/2)
                $0.top.equalTo(view.snp_centerYWithinMargins)
                $0.leading.equalTo(view.snp_centerXWithinMargins)
            }
            $0.backgroundColor = .systemGreen
            $0.setTitle("Complex Layouts", for: .normal)
            $0.addTarget(self, action: #selector(onComplexLayouts), for: .touchUpInside)
        }
    }
}


extension ViewController {
    @objc func onEntireView() {
        navigationController?.pushViewController(entireVC, animated: false)
    }
    @objc func onTableView() {
        
    }
    @objc func onCollectionView() {
        
    }
    @objc func onComplexLayouts() {
        
    }
}

