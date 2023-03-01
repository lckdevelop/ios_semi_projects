//
//  StoryboardViewController.swift
//  ReactorkitExam
//
//  Created by Chaekyeong Lee on 2023/03/01.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

final class StoryboardViewController: UIViewController, StoryboardView {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    var disposeBag = DisposeBag()
    
//    init(reactor: XibReactor) {
//        super.init(nibName: nil, bundle: nil)
//        self.reactor = reactor
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func bind(reactor: XibReactor) {
        //Action
        plusBtn.rx.tap
           .map{Reactor.Action.increase}
           .bind(to: reactor.action)
           .disposed(by: disposeBag)

        //State
        minusBtn.rx.tap
           .map{Reactor.Action.decrease}
           .bind(to: reactor.action)
           .disposed(by: disposeBag)

    }
 
}

