//
//  PulsaViewModel.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import Foundation
import RxSwift
import RxCocoa

final class PulsaViewModel {
    var items = BehaviorRelay<[PulsaViewSection]>(value: [])
    let dataSource = PulsaDataSources.dataSource()
    
    func fetchPulsaData(phoneNumber: String) {
        if phoneNumber.count < 4 {
            items.accept([
                .emptySection(item: .empty),
                .promoSection(item: promoData)
            ])
        } else {
            items.accept([
                .listPulsaSection(items: pulsaData),
                .promoSection(item: promoData)
            ])
        }
    }
}
