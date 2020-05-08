//
//  ViewController.swift
//  CustomUI-example
//
//  Created by sogihyeon on 2020/05/08.
//  Copyright © 2020 statios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK:- Views
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 4+88+4)
        cv.backgroundColor = .white
        return cv
    }()
    
    lazy var myTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tv.rowHeight = 88
        tv.tableHeaderView = myCollectionView
        return tv
    }()
    
    // MARK:- Properties
    fileprivate let cellId = "cell"
    
    
    // MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setAutolayout()
    }

}


// MARK:- UI
extension ViewController {
    func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.myTableView)
    }
    func setAutolayout() {
        self.myTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.myTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.contentView.backgroundColor = .systemYellow
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88, height: 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.contentView.backgroundColor = .systemTeal
        return  cell
    }
    
}
