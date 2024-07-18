//
//  PopAnimation.swift
//  LuckyUI
//
//  Created by junky on 2022/2/23.
//

import Foundation
import SnapKit
import UIKit

public enum PopAnimation {
    case none(position: PopPosition)
    case move(from: PopPosition, to: PopPosition)
    case scale(position: PopPosition, to: CGFloat)
    
    
    func fromPosition(_ view: UIView) {
        guard let spView = view.superview else { return }
        var lat = PopPosition.LateralPosition.fill(padding: -40)
        var lon = PopPosition.LongitudinalPosition.fill(padding: -40)
        var pos = PopPosition.inScreen(lateral: lat, longitudinal: lon)
        
        switch self {
        case .none(let position):
            pos = position
        case .move(let from, _):
            pos = from
        case .scale(let position, _):
            pos = position
        }
        
        switch pos {
        case .inScreen(let lateral, let longitudinal):
            lat = lateral
            lon = longitudinal
            view.snp.makeConstraints { make in
                
                switch lat {
                case .left(let padding):
                    make.left.equalTo(padding)
                case .center(let padding):
                    make.centerX.equalTo(spView).offset(padding)
                case .right(let padding):
                    make.right.equalTo(-padding)
                case .fill(let padding):
                    make.centerX.equalTo(spView)
                    make.width.equalTo(spView).offset(padding)
                }
                
                switch lon {
                case .top(let padding):
                    make.top.equalTo(padding)
                case .center(let padding):
                    make.centerY.equalTo(spView).offset(padding)
                case .bottom(let padding):
                    make.bottom.equalTo(-padding)
                case .fill(let padding):
                    make.centerY.equalTo(spView)
                    make.height.equalTo(spView).offset(padding)
                }
            }
        case .outScreen(let lateral, let longitudinal):
            lat = lateral
            lon = longitudinal
            view.snp.makeConstraints { make in
                
                switch lat {
                case .left(let padding):
                    make.right.equalTo(view.snp.left).offset(padding)
                case .center(let padding):
                    make.centerX.equalTo(spView).offset(padding)
                case .right(let padding):
                    make.left.equalTo(spView.snp.right).offset(padding)
                case .fill(let padding):
                    make.centerX.equalTo(spView)
                    make.width.equalTo(spView).offset(padding)
                }
                
                switch lon {
                case .top(let padding):
                    make.bottom.equalTo(spView.snp.top).offset(padding)
                case .center(let padding):
                    make.centerY.equalTo(spView).offset(padding)
                case .bottom(let padding):
                    make.top.equalTo(spView.snp.bottom).offset(padding)
                case .fill(let padding):
                    make.centerY.equalTo(spView)
                    make.height.equalTo(spView).offset(padding)
                }
            }
        }
        
    }
    
    func toPosition(_ view: UIView) {
        guard let spView = view.superview else { return }
        switch self {
        case .none(_):
            return
        case .move(_, let to):
            var moveX: CGFloat = 0
            var moveY: CGFloat = 0
            
            switch to {
            case .inScreen(lateral: let lat, longitudinal: let lon):
                switch lat {
                case .left(padding: let padding):
                    moveX = CGRectGetMinX(view.frame) - padding
                case .center(padding: let padding):
                    moveX = CGRectGetMidX(view.frame) - (CGRectGetMidX(spView.bounds) - padding)
                case .right(padding: let padding):
                    moveX = CGRectGetMinX(view.frame) - CGRectGetMaxX(spView.bounds) + padding
                case .fill(padding: let padding):
                    moveX = 0
                }
                
                switch lon {
                case .top(padding: let padding):
                    moveY = CGRectGetMinY(view.frame) - padding
                case .center(padding: let padding):
                    moveY = CGRectGetMinY(view.frame) - (CGRectGetMidY(spView.bounds) - padding)
                case .bottom(padding: let padding):
                    moveY = CGRectGetMaxY(view.frame) - CGRectGetMaxY(spView.bounds) + padding
                case .fill(padding: let padding):
                    moveY = CGRectGetMinY(view.frame) - padding / 2
                }
                
            case .outScreen(lateral: let lat, longitudinal: let lon):
                
                switch lat {
                case .left(padding: let padding):
                    moveX = CGRectGetMaxX(view.frame) - padding
                case .center(padding: let padding):
                    moveX = CGRectGetMinX(view.frame) - (CGRectGetMidX(spView.bounds) - padding)
                case .right(padding: let padding):
                    moveX = CGRectGetMinX(view.frame) - CGRectGetMaxX(spView.bounds) - padding
                case .fill(padding: let padding):
                    moveX = CGRectGetMaxX(view.frame) - padding / 2
                }
                
                switch lon {
                case .top(padding: let padding):
                    moveY = CGRectGetMaxY(view.frame) - padding
                case .center(padding: let padding):
                    moveY = CGRectGetMinY(view.frame) - (CGRectGetMidY(spView.bounds) - padding)
                case .bottom(padding: let padding):
                    moveY = CGRectGetMinY(view.frame) - CGRectGetMaxX(spView.bounds) - padding
                case .fill(padding: let padding):
                    moveY = CGRectGetMaxY(view.frame) - padding / 2
                }
            }
            view.transform = CGAffineTransformMakeTranslation(-moveX, -moveY)
        case .scale(_, let to):
            view.transform = CGAffineTransformMakeScale(to, to)
        }
    }
    
    
    
    
}

