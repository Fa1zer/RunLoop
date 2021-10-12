//
//  ProfileTimerFooterView.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 12.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class ProfileTimerFooterView: UIView {

    let timerLabel: UILabel = {
       let label = UILabel()
        
        label.tintColor = .systemGray6
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .white
        alpha = 0.8
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(timerLabel)
        
        timerLabel.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(8)
        }
    }
}
