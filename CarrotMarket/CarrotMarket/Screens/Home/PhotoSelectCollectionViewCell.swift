//
//  PhotoSelectCollectionViewCell.swift
//  CarrotMarket
//
//  Created by 김인영 on 2022/12/17.
//

import UIKit
import SnapKit
import Then

class PhotoSelectCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoSelectCollectionViewCell"
    
    private let selectButtonView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 1.5
        $0.layer.cornerRadius = 4
        $0.layer.borderColor = UIColor.squaregray.cgColor
    }
    
    private let cameraIcon = UIImageView().then {
        $0.image = UIImage(named: "ios_camera")
        $0.contentMode = .scaleAspectFit
    }
    
    private var selectedNumberLabel = UILabel().then {
        $0.text = "2"
        $0.textColor = .orange
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
    private let totalLabel = UILabel().then {
        $0.text = "/10"
        $0.textColor = .linegray
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoSelectCollectionViewCell {
    private func setLayout() {
        contentView.addSubviews(selectButtonView)
        
        selectButtonView.addSubviews(
            cameraIcon,
            selectedNumberLabel,
            totalLabel
        )
        
        selectButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cameraIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        selectedNumberLabel.snp.makeConstraints {
            $0.top.equalTo(cameraIcon.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
        }
        
        totalLabel.snp.makeConstraints {
            $0.top.equalTo(selectedNumberLabel)
            $0.leading.equalTo(selectedNumberLabel.snp.trailing)
        }
    }
    
    func dataBind(model : SelectModel) {
        selectedNumberLabel.text = "\(model.selectedNumber)"
    }
}
