//
//  WritingViewController.swift
//  CarrotMarket
//
//  Created by 김인영 on 2022/12/16.
//

import UIKit
import SnapKit
import Then

class WritingViewController: UIViewController {

    //MARK: - Dummy Photo Data
    
    let photoList : [PhotoModel] = [
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view")),
        PhotoModel(image: UIImage(named: "ios_image_view"))
    ]
    
    //MARK: - UI Components
    
    private let naviView = UIView()
    private lazy var closeButton = UIButton().then {
        $0.setTitle("닫기", for: .normal)
        $0.setTitleColor(UIColor.deepgray, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansSC-Regular", size: 17)
        $0.addTarget(self, action: #selector(touchUpCloseButton), for: .touchUpInside)
    }
    private let naviTitleLabel = UILabel().then {
        $0.text = "중고거래 글쓰기"
        $0.font = UIFont(name: "NotoSansSC-Bold", size: 16)
    }
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(UIColor.orrange_btn, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansSC-Regular", size: 17)
    }
    private let naviUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.square_gray
    }
    
    private let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    private let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }

    private lazy var collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
    }

    private let underlineView1 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    private let titleTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "글 제목", attributes: [.foregroundColor: UIColor.systemGray])
    }
    private let underlineView2 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    private let categoryTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "카테고리", attributes: [.foregroundColor: UIColor.systemGray])
    }
    private let underlineView3 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    private let priceTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "₩ 가격", attributes: [.foregroundColor: UIColor.systemGray])
    }
    private let underlineView4 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    private let contentsTextView = UITextView()
    
    private let bottomView = UIView()
    
    private lazy var oftenUsedButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_icon_often"), for: .normal)
    }
    private let oftenUsedLabel = UILabel().then {
        $0.text = "자주 쓰는 문구"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    private lazy var filterButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_icon_filter"), for: .normal)
    }
    private let filterLabel = UILabel().then {
        $0.text = "보여줄 동네 설정"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    private let underlineView5 = UIView().then {
        $0.backgroundColor = .linegray2
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }
    
    @objc private func touchUpCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension WritingViewController {
    
    //MARK: - register
    
    private func register() {
        collectionView.register(PhotoSelectCollectionViewCell.self, forCellWithReuseIdentifier: PhotoSelectCollectionViewCell.identifier)
        collectionView.register(SelectedPhotoCollectionViewCell.self, forCellWithReuseIdentifier: SelectedPhotoCollectionViewCell.identifier)
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews(naviView, bottomView, scrollView)
        
        naviView.addSubviews(
            closeButton,
            naviTitleLabel,
            completeButton,
            naviUnderlineView
        )
        
        bottomView.addSubviews(
            oftenUsedButton,
            oftenUsedLabel,
            filterButton,
            filterLabel,
            underlineView5
        )
        
        scrollView.addSubviews(
            collectionView,
            underlineView1,
            titleTextField,
            underlineView2,
            categoryTextField,
            underlineView3,
            priceTextField,
            underlineView4,
            contentsTextView
        )
        
        // naviView
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        closeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        naviTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        completeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        naviUnderlineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        //BottomView
        bottomView.snp.makeConstraints {
            $0.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(47)
        }
        oftenUsedButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
        oftenUsedLabel.snp.makeConstraints {
            $0.leading.equalTo(oftenUsedButton.snp.trailing).offset(5)
            $0.centerY.equalToSuperview()
        }
        filterButton.snp.makeConstraints {
            $0.leading.equalTo(oftenUsedLabel.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        filterLabel.snp.makeConstraints {
            $0.leading.equalTo(filterButton.snp.trailing).offset(5)
            $0.centerY.equalToSuperview()
        }
        underlineView5.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(bottomView.snp.top)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(108)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        underlineView1.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        titleTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.top.equalTo(underlineView1.snp.bottom).offset(23)
            $0.height.equalTo(24)
        }
        underlineView2.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(23)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        categoryTextField.snp.makeConstraints {
            $0.top.equalTo(underlineView2.snp.bottom).offset(23)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(24)
        }
        underlineView3.snp.makeConstraints {
            $0.top.equalTo(categoryTextField.snp.bottom).offset(23)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        priceTextField.snp.makeConstraints {
            $0.top.equalTo(underlineView3.snp.bottom).offset(23)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(24)
        }
        underlineView4.snp.makeConstraints {
            $0.top.equalTo(priceTextField.snp.bottom).offset(23)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        contentsTextView.snp.makeConstraints {
            $0.top.equalTo(underlineView4.snp.bottom).offset(23)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.bottom.equalTo(bottomView.snp.top)
            $0.height.equalTo(327)
        }
    }
}

//MARK: - CollectionView Delegate

extension WritingViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 22, left: 19, bottom: 22, right: 19)
        }
}

extension WritingViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cameraCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoSelectCollectionViewCell.identifier, for: indexPath) as? PhotoSelectCollectionViewCell else { return UICollectionViewCell() }

        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedPhotoCollectionViewCell.identifier, for: indexPath) as? SelectedPhotoCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row == 0 {
            cameraCell.dataBind(model: SelectModel(selectedNumber: 2))
        } else {
            photoCell.dataBind(model: photoList[indexPath.row - 1])
        }
        
        return photoCell
    }
}

