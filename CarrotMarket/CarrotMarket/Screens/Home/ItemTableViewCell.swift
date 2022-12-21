//
//  ItemTableViewCell.swift
//  CarrotMarket
//
//  Created by 김인영 on 2022/12/14.
//

import UIKit
import SnapKit
import Then

class ItemTableViewCell: UITableViewCell {
    
    static let identifier = "ItemTableViewCell"
    
    private let itemImage = UIImageView().then {
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    private let itemTitle = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "NotoSansSC-Regular", size: 15)
    }
    private let itemTown = UILabel().then {
        $0.textColor = UIColor.darklightgray
        $0.font = UIFont(name: "Poppins-Medium", size: 11)
    }
    private let itemTime = UILabel().then {
        $0.textColor = UIColor.darklightgray
        $0.font = UIFont(name: "Poppins-Medium", size: 11)
    }
    private let itemPrice = UILabel().then {
        $0.textColor = UIColor.deepgray
        $0.font = UIFont(name: "Poppins-Bold", size: 15)
    }
    private let itemLikeButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_icon_heart_off"), for: .normal)
        $0.tintColor = .square_gray
        
    }
    private let itemLikeNum = UILabel().then {
        $0.textColor = UIColor.deepgray
        $0.font = UIFont(name: "Poppins-Medium", size: 12)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ItemTableViewCell {
    func setLayout() {
        contentView.addSubviews(
            itemImage,
            itemTitle,
            itemTime,
            itemTown,
            itemPrice,
            itemLikeButton,
            itemLikeNum
        )
        
        itemImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(103)
        }
        itemTitle.snp.makeConstraints {
            $0.leading.equalTo(itemImage.snp.trailing).offset(17)
            $0.top.equalToSuperview().offset(15)
        }
        itemTown.snp.makeConstraints {
            $0.leading.equalTo(itemTitle)
            $0.top.equalTo(itemTitle.snp.bottom).offset(4)
        }
        itemTime.snp.makeConstraints {
            $0.leading.equalTo(itemTown.snp.trailing).offset(10)
            $0.centerY.equalTo(itemTown)
        }
        itemPrice.snp.makeConstraints {
            $0.leading.equalTo(itemTitle)
            $0.top.equalTo(itemTown.snp.bottom).offset(3)
        }
        
    }
    func dataBind(model: ItemModel) {
        itemImage.image = model.image
        itemTitle.text = model.title
        itemTown.text = model.town
        itemTime.text = model.time
        itemPrice.text = "\(model.price)원"
        itemLikeNum.text = "\(model.like)"
    }
    
    func setItemLike(model: ItemModel) {
        if model.like > 0 {
            itemLikeButton.snp.makeConstraints {
                $0.width.height.equalTo(20)
                $0.trailing.equalToSuperview().inset(28)
                $0.bottom.equalToSuperview().inset(13)
            }
            itemLikeNum.snp.makeConstraints {
                $0.leading.equalTo(itemLikeButton.snp.trailing).offset(2)
                $0.centerY.equalTo(itemLikeButton)
            }
        }
    }
}
