//
//  DataPackageViewModel.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import Foundation
import RxSwift
import RxCocoa

final class DataPackageViewModel {
    var items = BehaviorRelay<[DataPackageViewSection]>(value: [])
    
    func fetchPackageData(phoneNumber: String) {
        if phoneNumber.count < 4 {
            items.accept([
                .emptySection(item: .empty),
                .promoSection(item: packageDataPromo)
            ])
        } else {
            items.accept([
                .listDataPackage(items: packageData),
                .promoSection(item: packageDataPromo)
            ])
        }
    }
}
