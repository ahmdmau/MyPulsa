//
//  PulsaViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Differentiator
import ContactsUI

class PulsaViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    private let viewModel: PulsaViewModel
    
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
        self.addKeyboardObserver(scrollView: tableView)
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardObserver()
    }
    
    @IBAction func contactTapped(_ sender: UIButton) {
        presentContactPicker()
    }
    
    func presentContactPicker() {
        let contactPickerVC = CNContactPickerViewController()
        contactPickerVC.delegate = self
        present(contactPickerVC, animated: true)
    }
}

// MARK: - Methods
extension PulsaViewController {
    
    private func setupTextField() {
        phoneTextField.text = PhoneNumber.defaultPhoneNumber
        phoneTextField.delegate = self
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
            .bind(to: tableView.rx.items(dataSource: dataSource()))
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

extension PulsaViewController {
    func dataSource() -> RxTableViewSectionedReloadDataSource<PulsaViewSection> {
        return RxTableViewSectionedReloadDataSource<PulsaViewSection>(configureCell: { dataSource, tableView, indexPath, _ in
            switch dataSource[indexPath] {
            case .listPulsa(let data):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PulsaItemTableViewCell.identifier, for: indexPath) as? PulsaItemTableViewCell else {
                    return UITableViewCell()
                }
                cell.setup(with: data)
                cell.delegate = self
                return cell
            case .promos(let promoData):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PromoTableViewCell.identifier, for: indexPath) as? PromoTableViewCell else {
                    return UITableViewCell()
                }
                cell.delegate = self
                cell.promos = promoData
                return cell
            case .empty:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell else {
                    return UITableViewCell()
                }
                
                return cell
            }
        })
    }
}

// MARK: - UITextField
extension PulsaViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength: Int = textField.text!.count + string.count - range.length
        let numberOnly = NSCharacterSet.init(charactersIn: ACCEPTABLE_NUMBERS).inverted
        let strValid = string.rangeOfCharacter(from: numberOnly) == nil
        return (strValid && (newLength <= MAX_LENGTH_PHONENUMBER))
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

// MARK: - Pulsa Item Delegate
extension PulsaViewController: PulsaItemDelegate {
    func didSelect(data: PulsaModel) {
        let orderModel = OrderModel(id: "TRX001", orderName: "Pulsa", nominal: data.nominal, phoneNumber: phoneTextField.text ?? "")
        self.navigationController?.pushViewController(ConfirmationViewController(orderModel: orderModel), animated: true)
    }
}

// MARK: - Promo Delegate
extension PulsaViewController: PromoDelegate {
    func didPromoTapped(promoModel: PromoModel) {
        let viewController = MerchantPromoViewController(promoModel: promoModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Contact UI
extension PulsaViewController: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
            phoneTextField.text = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}
