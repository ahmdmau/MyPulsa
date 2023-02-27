//
//  MerchantPromoViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import UIKit

enum MerchatPromoCellType {
    case promoBanner(promoModel: PromoModel)
    case promoInfo(promoModel: PromoModel)
    case promoTnc(tnc: String)
}

class MerchantPromoViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    private var cellType: [MerchatPromoCellType] = []
    
    init(promoModel: PromoModel) {
        self.cellType = [
            .promoBanner(promoModel: promoModel),
            .promoInfo(promoModel: promoModel),
            .promoTnc(tnc: tncPromo)
        ]
        super.init(nibName: "MerchantPromoViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Merchant Promo"
        self.configureNavBar(colorType: .solid, style: .backOnly)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PromoBannerTableViewCell.nib(), forCellReuseIdentifier: PromoBannerTableViewCell.identifier)
        tableView.register(PromoInfoTableViewCell.nib(), forCellReuseIdentifier: PromoInfoTableViewCell.identifier)
        tableView.register(PromoTncTableViewCell.nib(), forCellReuseIdentifier: PromoTncTableViewCell.identifier)
    }

}

// MARK: - TableView Delegate & Data Source
extension MerchantPromoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellType[indexPath.row] {
        case .promoBanner(let promoModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PromoBannerTableViewCell.identifier, for: indexPath) as? PromoBannerTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: promoModel)
            return cell
        case .promoInfo(let promoModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PromoInfoTableViewCell.identifier, for: indexPath) as? PromoInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: promoModel)
            cell.delegate = self
            return cell
        case .promoTnc(let tnc):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PromoTncTableViewCell.identifier, for: indexPath) as? PromoTncTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: tnc)
            return cell
        }
        
    }
}

extension MerchantPromoViewController: PromoInfoDelegate {
    func didCopyVoucher(voucherCode: String) {
        self.showPrimaryToast(message: "Berhasil salin voucher code: \(voucherCode)")
    }
}
