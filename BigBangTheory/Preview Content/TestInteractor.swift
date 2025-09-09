//
//  TestInteractor.swift
//  BigBangTheory
//
//  Created by Yery Castro on 14/3/24.
//

import Foundation

struct TestInteractor: Interactor {
    let urlBundle = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    let docURL = URL.documentsDirectory.appending(path: "BigBang.json")
}
extension BigBang {
    static let test = BigBang(id: 2928,
                              season: 1,
                              number: 16,
                              summary: "When Penny learns that Leonard doesn't celebrate birthdays, she attempts to throw him a surprise party, but is sidetracked by Sheldon who unexpectedly gets to live out one of his greatest fantasies at an electronics store.\n",
                              runtime: 30,
                              airdate: "2008-05-12",
                              image: "12464",
                              name: "The Peanut Reaction",
                              url: "https://www.tvmaze.com/episodes/2928/the-big-bang-theory-1x16-the-peanut-reaction")
}
extension BigBangVM {
    static let preview = BigBangVM(interactor: TestInteractor())
}


