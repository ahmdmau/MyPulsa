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
    PromoModel(id: 1, promoTitle: "Nikmati Diskon Hingga 50% untuk Pembelian Pulsa!", validDate: "7-8 April 2023", voucherCode: "BHDN1U9M", bannerImage: "dummy-indosat"),
    PromoModel(id: 2, promoTitle: "Beli Pulsa Sekarang, Dapatkan Kuota Data Gratis!", validDate: "12-13 Mei 2023", voucherCode: "YGTC2E5W", bannerImage: "dummy-three"),
    PromoModel(id: 3, promoTitle: "Hemat Uang dengan Paket Pulsa Super Murah!", validDate: "21-22 Juli 2023", voucherCode: "FJMP7S8H", bannerImage: "dummy-telkomsel"),
    PromoModel(id: 4, promoTitle: "Promo Terbatas! Beli Pulsa dan Dapatkan Hadiah Langsung!", validDate: "16-17 September 2023", voucherCode: "XNKR9L3P", bannerImage: "dummy-xl"),
    PromoModel(id: 5, promoTitle: "Jangan Lewatkan Promo Terbaru: Beli Pulsa dan Dapatkan Cashback!", validDate: "23-24 November 2023", voucherCode: "VOUKQ6D4", bannerImage: "dummy-smartfren"),
]

let promoData: [PulsaItemView] = [
    .promos(data: promos)
]

let packageDataPromo: [DataPackageItemView] = [
    .promos(data: promos)
]


let tncPromo = """
<h1>Syarat dan Ketentuan Promo Pulsa</h1>
<ul>
    <li>Promo ini berlaku pada tanggal 1 April 2023 sampai dengan 30 April 2023.</li>
    <li>Promo hanya berlaku untuk pembelian pulsa minimal Rp. 50.000,- dalam satu transaksi.</li>
    <li>Promo hanya berlaku untuk pelanggan yang melakukan pembelian melalui situs kami.</li>
    <li>Pelanggan akan mendapatkan bonus kuota data sebesar 1GB untuk setiap pembelian pulsa dengan nominal minimal Rp. 50.000,-.</li>
    <li>Bonus kuota data akan otomatis aktif setelah pelanggan melakukan pembelian pulsa.</li>
    <li>Bonus kuota data hanya berlaku untuk pelanggan yang memenuhi syarat dan ketentuan promo ini.</li>
    <li>Promo ini tidak dapat digabungkan dengan promo atau diskon lainnya.</li>
    <li>Kami berhak untuk membatalkan promo atau mengubah syarat dan ketentuan promo sewaktu-waktu tanpa pemberitahuan terlebih dahulu.</li>
    <li>Dengan mengikuti promo ini, pelanggan dianggap telah membaca dan menyetujui semua syarat dan ketentuan yang berlaku.</li>
</ul>
"""
