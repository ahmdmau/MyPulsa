//
//  Constants.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import Foundation

struct PhoneNumber {
    static let defaultPhoneNumber = "081295365029"
}

let pulsaData: [PulsaItemView] = [
    .listPulsa(data: PulsaModel(id: 1, nominal: 5000)),
    .listPulsa(data: PulsaModel(id: 2, nominal: 10000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 15000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 20000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 25000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 30000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 50000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 75000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 100000)),
    .listPulsa(data: PulsaModel(id: 1, nominal: 200000))
]

let promos: [PromoModel] = [
    PromoModel(id: 1, bannerImage: "dummy-indosat"),
    PromoModel(id: 2, bannerImage: "dummy-three"),
    PromoModel(id: 3, bannerImage: "dummy-telkomsel"),
    PromoModel(id: 4, bannerImage: "dummy-xl"),
    PromoModel(id: 5, bannerImage: "dummy-smartfren"),
]

let promoData: [PulsaItemView] = [
    .promos(data: promos)
]
