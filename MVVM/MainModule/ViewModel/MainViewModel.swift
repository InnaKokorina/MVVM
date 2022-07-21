//
//  MainViewModel.swift
//  MVVM
//
//  Created by Inna Kokorina on 20.07.2022.
//

import Foundation
protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set}
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())?
    init() {
        updateViewData?(.initial)
    }
    public func error() {
        updateViewData?(.failure(ViewData.Data(icon: "failure", title: "Failure", description: "Error", numberPhone: nil)))
    }
  public func startFetch() {
            updateViewData?(.success(ViewData.Data(icon: "success", title: "Success", description: "Good", numberPhone: nil)))
    }
}
