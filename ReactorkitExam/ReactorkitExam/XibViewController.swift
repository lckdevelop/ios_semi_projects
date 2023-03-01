//
//  XibViewController.swift
//  ReactorkitExam
//
//  Created by Chaekyeong Lee on 2023/03/01.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class XibViewController: UIViewController, View {
    @IBOutlet weak var NumberLabel: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    var disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: "XibViewController", bundle: nil)
        //self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func bind(reactor: XibReactor) {
        //Action
        plusBtn.rx.tap
           .map{Reactor.Action.increase}
           .bind(to: reactor.action)
           .disposed(by: disposeBag)

        //State

    }
}
