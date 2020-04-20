//
//  ViewController.swift
//  reactorkit-example
//
//  Created by sogihyeon on 2020/04/20.
//  Copyright © 2020 statios. All rights reserved.
//

import UIKit
import ReactorKit

class CounterViewController: BaseViewController, View {
    
    let decreaseButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    let increaseButton = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    let valueLabel = UILabel()
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.decreaseButton)
        self.view.addSubview(self.increaseButton)
        self.view.addSubview(self.valueLabel)
        self.view.addSubview(self.activityIndicatorView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        self.decreaseButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(-64)
        }
        self.valueLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        self.increaseButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(64)
        }
        self.activityIndicatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(32)
        }
    }
    
    func bind(reactor: CounterViewReactor) {
        //Action
        increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //State
        reactor.state.map { $0.value }
            .distinctUntilChanged()
            .map { "\($0)" }
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        }
}
    
