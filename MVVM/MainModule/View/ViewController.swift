//
//  ViewController.swift
//  MVVM
//
//  Created by Inna Kokorina on 20.07.2022.
//

import UIKit

class ViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var testView: View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel() // лучше проинициализировать
        createView()
        updateView()
    }

    func createView() {
        testView = View()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    @IBAction func startFetch(_ sender: Any) {
        viewModel.startFetch()
    }
}

