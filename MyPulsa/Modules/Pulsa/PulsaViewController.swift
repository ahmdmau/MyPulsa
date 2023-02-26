//
//  PulsaViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit
import TweeTextField
import RxSwift
import RxCocoa

class PulsaViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    private let viewModel: PulsaViewModel
    let disposeBag = DisposeBag()
    
    init(viewModel: PulsaViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PulsaViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindTableView()
        setupTextField()
    }
    
}

// MARK: - Methods
extension PulsaViewController {
    
    private func setupTextField() {
        phoneTextField.text = PhoneNumber.defaultPhoneNumber
        
        phoneTextField.rx
            .text
            .observe(on: MainScheduler.asyncInstance)
            .debounce(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe { [weak self] value in
                self?.viewModel.fetchPulsaData(phoneNumber: value ?? "")
            }.disposed(by: disposeBag)
    }
    
    private func bindTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.items
                    .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
                    .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.register(PulsaItemTableViewCell.nib(), forCellReuseIdentifier: PulsaItemTableViewCell.identifier)
        tableView.register(PromoTableViewCell.nib(), forCellReuseIdentifier: PromoTableViewCell.identifier)
        tableView.register(EmptyTableViewCell.nib(), forCellReuseIdentifier: EmptyTableViewCell.identifier)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
}

// MARK: - UITableView Protocol
extension PulsaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }

}
