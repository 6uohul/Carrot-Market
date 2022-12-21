//
//  HomeViewController.swift
//  Carrot-Market
//
//  Created by 김인영 on 2022/12/14.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    let itemDummy : [ItemModel] = [
        ItemModel(image: UIImage(named: "ios_image_view"), title: "기본 셔링 반팔티", town: "동대문구 제기동", time: "1분 전", price: 6000, like: 5),
        ItemModel(image: UIImage(named: "ios_image_view"), title: "기본 셔링 반팔티", town: "동대문구 제기동", time: "1분 전", price: 6000, like: 0),
        ItemModel(image: UIImage(named: "ios_image_view"), title: "기본 셔링 반팔티", town: "동대문구 제기동", time: "1분 전", price: 6000, like: 0),
        ItemModel(image: UIImage(named: "ios_image_view"), title: "기본 셔링 반팔티", town: "동대문구 제기동", time: "1분 전", price: 6000, like: 1),
        ItemModel(image: UIImage(named: "ios_image_view"), title: "기본 셔링 반팔티", town: "동대문구 제기동", time: "1분 전", price: 6000, like: 3),
        ItemModel(image: UIImage(named: "ios_image_view"), title: "기본 셔링 반팔티", town: "동대문구 제기동", time: "1분 전", price: 6000, like: 10)
    ]
    
    
    //MARK: - UI Components
    
    private let naviView = UIView()
    private let townName = UILabel().then {
        $0.text = "상봉제1동"
        $0.font = UIFont(name: "NotoSansSC-Bold", size: 16)
    }
    private let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_icon_search"), for: .normal)
    }
    private let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_icon_cate"), for: .normal)
    }
    private let bellButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_icon_bell"), for: .normal)
    }
    private let naviUnderlineView = UIView().then {
        $0.backgroundColor = UIColor.square_gray
    }
    
    private lazy var tableView = UITableView().then {
        $0.allowsSelection = false
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
    }
    
    private lazy var plusButton = UIButton().then {
        $0.setImage(UIImage(named: "ios_floating_button"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpPlusButton), for: .touchUpInside)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }
    
    @objc private func touchUpPlusButton() {
        let writingVC = WritingViewController()
        self.navigationController?.pushViewController(writingVC, animated: true)
        writingVC.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController {
    
    func register() {
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }
    
    func setLayout() {
        view.addSubviews(naviView, tableView, plusButton)
        
        naviView.addSubviews(
            townName,
            searchButton,
            menuButton,
            bellButton,
            naviUnderlineView
        )
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        townName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(15)
        }
        bellButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
        menuButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(bellButton.snp.leading).offset(-16)
        }
        searchButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(menuButton.snp.leading).offset(-16)
        }
        naviUnderlineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.width.height.equalTo(54)
        }
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemCell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        itemCell.dataBind(model: itemDummy[indexPath.row])
        itemCell.setItemLike(model: itemDummy[indexPath.row])
        return itemCell
    }
    
    
}
