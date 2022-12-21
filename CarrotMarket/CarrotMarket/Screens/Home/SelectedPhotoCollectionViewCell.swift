//
//  SelectedPhotoCollectionViewCell.swift
//  CarrotMarket
//
//  Created by 김인영 on 2022/12/22.
//

import UIKit
import SnapKit
import Then

class SelectedPhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SelectedPhotoCollectionViewCell"
    
    private let selectButtonView = UIImageView().then {
        $0.backgroundColor = .squaregray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectedPhotoCollectionViewCell {
    private func setLayout() {
        contentView.addSubviews(selectButtonView)
        
        selectButtonView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(model : PhotoModel) {
        selectButtonView.image = model.image
    }
}
