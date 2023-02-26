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

 let MAX_LENGTH_PHONENUMBER = 13
 let ACCEPTABLE_NUMBERS     = "0123456789"

let pulsaData: [PulsaItemView] = [
    .listPulsa(data: PulsaModel(id: 1, nominal: 5000)),
    .listPulsa(data: PulsaModel(id: 2, nominal: 10000)),
    .listPulsa(data: PulsaModel(id: 3, nominal: 15000)),
    .listPulsa(data: PulsaModel(id: 4, nominal: 20000)),
    .listPulsa(data: PulsaModel(id: 5, nominal: 25000)),
    .listPulsa(data: PulsaModel(id: 6, nominal: 30000)),
    .listPulsa(data: PulsaModel(id: 7, nominal: 50000)),
    .listPulsa(data: PulsaModel(id: 8, nominal: 75000)),
    .listPulsa(data: PulsaModel(id: 9, nominal: 100000)),
    .listPulsa(data: PulsaModel(id: 10, nominal: 200000))
]

let packageData: [DataPackageItemView] = [
    .listDataPackage(data: DataPackageModel(id: 1, nominal: 10000, dataPackageName: "Paket Internet Harian 2GB")),
    .listDataPackage(data: DataPackageModel(id: 2, nominal: 10000, dataPackageName: "Paket Bicara Semua Operator")),
    .listDataPackage(data: DataPackageModel(id: 3, nominal: 5000, dataPackageName: "Paket Zoom 500Mb")),
    .listDataPackage(data: DataPackageModel(id: 4, nominal: 25000, dataPackageName: "Paket Zoom 1,5Gb")),
    .listDataPackage(data: DataPackageModel(id: 5, nominal: 25000, dataPackageName: "GigaMax Fit")),
    .listDataPackage(data: DataPackageModel(id: 6, nominal: 48000, dataPackageName: "OMG! 7Gb 1Bulan")),
    .listDataPackage(data: DataPackageModel(id: 7, nominal: 65000, dataPackageName: "OMG! 12Gb 1Bulan")),
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

let packageDataPromo: [DataPackageItemView] = [
    .promos(data: promos)
]
