//
//  EntireVC.swift
//  ViewAnimator-example
//
//  Created by sogihyeon on 2020/02/05.
//  Copyright © 2020 sogihyeon. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator

class EntireVC: UIViewController {
    
    // MARK:- Views
    lazy var collectionView: UICollectionView = {
        let layer = UICollectionViewFlowLayout()
        layer.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layer)
    }()
    lazy var tableView = UITableView()
    
    // MARK:- Properties
    fileprivate let cellId = "cell"
    
    // MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

extension EntireVC {
    func setupUI() {
        _ = view.then {
            $0.backgroundColor = .white
            $0.addSubview(collectionView)
            $0.addSubview(tableView)
        }
        _ = collectionView.then {
            $0.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(view.frame.width/5+16)
            }
            $0.backgroundColor = .white
            $0.delegate = self
            $0.dataSource = self
            $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        }
        _ = tableView.then {
            $0.snp.makeConstraints {
                $0.top.equalTo(collectionView.snp_bottomMargin).offset(8)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            $0.backgroundColor = .white
            $0.separatorStyle = .none
            $0.delegate = self
            $0.dataSource = self
        }
    }
    func animation() {
        let CVAnis = [AnimationType.from(direction: .right, offset: 120)]
        let TVAnis = [AnimationType.from(direction: .bottom, offset: 72)]
        UIView.animate(views: collectionView.visibleCells,
                       animations: CVAnis,
                       duration: 0.75)
        UIView.animate(views: tableView.visibleCells,
                       animations: TVAnis,
                       delay: 0.125,
                       duration: 0.75)
    }
}

extension EntireVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/5, height: view.frame.width/5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
}

extension EntireVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width/3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemRed
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        cell.contentView.layer.borderWidth = 4
        cell.selectionStyle = .none
        return cell
    }
    
    
}
