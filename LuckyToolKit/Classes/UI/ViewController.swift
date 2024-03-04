//
//  ViewController.swift
//  LuckyUI
//
//  Created by junky on 2024/2/23.
//

import UIKit
import Combine
import SnapKit

open class ViewController: UIViewController {

    open override var title: String? {
        didSet {
            navigationBar.title = title ?? ""
        }
    }
    
    open var navigationBar: NavigationBar = NavigationBar.loadFromXib()
    
    open var cancellables: Set<AnyCancellable> = []
    
    deinit {
        cancellables.forEach{$0.cancel()}
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindVM()
    }

    open func setupUI() {
        
        navigationBar.isHidden = navigationController == nil
        let topMargin: CGFloat = navigationBar.isHidden ? 0 : 44;
        additionalSafeAreaInsets.top += topMargin
        
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.bottom.equalTo(view.snp.topMargin)
        }
        
    }
    
    open func bindVM() {
        navigationBar.backBtn.publisher(events: .touchUpInside).sinkOnMain { [weak self] _ in
            guard let weakself = self else { return }
            weakself.navigationController?.popViewController(animated: true)
        }.store(in: &cancellables)
    }

}
