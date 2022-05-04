//
//  ActingView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 12.04.2022.
//

import UIKit

class ActingView: UIView {
    
    weak var delegate: FillArrayDelegate?
    
    var typeArray = [ActingTypeOfCell.all.rawValue, ActingTypeOfCell.cast.rawValue, ActingTypeOfCell.crew.rawValue]
    
    var typeOfCell: ActingTypeOfCell = .all
    
    private let stack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    private let headingLabelView = UIView()
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.ActingController.black
        $0.font = Fonts.ActingController.categoryFont
        $0.text = Strings.ActingController.header
    }
    
    private let buttonStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 2
    }
    
    let dropDawnButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(ActingTypeOfCell.all.rawValue, for: .normal)
        $0.titleLabel?.font = Fonts.ActingController.dropDownFont
        $0.setTitleColor(Colors.ActingController.black, for: .normal)
        $0.setImage(UIImage(named: "down"), for: .normal)
    }
    
    let dropDownTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = false
        $0.register(DropDownTableViewCell.self, forCellReuseIdentifier: DropDownTableViewCell.identifier)
        $0.rowHeight = 30
        $0.separatorStyle = .none
        $0.alpha = 0
        $0.isHidden = true
    }
    
    let actingTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = false
        $0.register(ActingTableViewCell.self, forCellReuseIdentifier: ActingTableViewCell.identifier)
        $0.rowHeight = 50
        $0.separatorStyle = .none
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        addSubview(stack)
        stack.addArrangedSubview(headingLabelView)
        stack.addArrangedSubview(actingTableView)
        headingLabelView.addSubview(headingLabel)
        headingLabelView.addSubview(buttonStack)
        stack.insertSubview(buttonStack, aboveSubview: actingTableView)
        buttonStack.addArrangedSubview(dropDawnButton)
        buttonStack.addArrangedSubview(dropDownTableView)
        setNeedsUpdateConstraints()
        dropDawnButton.addTarget(self, action: #selector(buttonDropDawnTapped), for: .primaryActionTriggered)
        dropDownTableView.dataSource = self
        dropDownTableView.delegate = self
    }
    
    @objc func buttonDropDawnTapped() {
        UIView.animate(withDuration: 0.7) { [weak self] in
            guard let self = self else { return }
            self.dropDownTableView.isHidden = !self.dropDownTableView.isHidden
            self.dropDownTableView.alpha = self.dropDownTableView.alpha == 0 ? 1 : 0
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
        
        buttonStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(80)
        }
        
        actingTableView.snp.makeConstraints {
            $0.height.equalTo(700)
        }
        
        dropDownTableView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
}
