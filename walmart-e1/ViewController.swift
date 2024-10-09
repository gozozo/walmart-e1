//
//  ViewController.swift
//  walmart-e1
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import UIKit

class ViewController: UIViewController {
    var numbers: [Int] = []
    let operation = SOperation()

    @IBOutlet weak var dataTextView: UITextView!

    @IBOutlet weak var forResultLabel: UILabel!
    @IBOutlet weak var filterResultLabel: UILabel!
    @IBOutlet weak var inlineResultLabel: UILabel!

    @IBAction func sum(_ sender: Any) {

        var start = Date()
        let addFor = operation.addEvenForLoop(array: numbers)
        var end = Date()
        let timeFor = end.timeIntervalSince(start)
        start = Date()
        let addFilterReduce = operation.addEvenFilterReduce(array: numbers)
        end = Date()
        let timeFilterReduce = end.timeIntervalSince(start)
        start = Date()
        let addInlineReduce = operation.addEvenInlineReduce(array: numbers)
        end = Date()
        let timeInlineReduce = end.timeIntervalSince(start)

        forResultLabel.text = buildText(forMethod: "For", result: addFor, time: timeFor)
        filterResultLabel.text = buildText(forMethod: "Filter Reduce", result: addFilterReduce, time: timeFilterReduce)
        inlineResultLabel.text = buildText(forMethod: "Inline Reduce", result: addInlineReduce, time: timeInlineReduce)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numbers = generateArray()
        dataTextView.text = numbers.toJSON()
    }

    private func generateArray() -> [Int] {
        return (1...10000).map { _ in Int.random(in: 0...100) }
    }

    private func buildText(forMethod: String, result: Int, time: Double) -> String {
        return "\(forMethod) Result: \(result) Time: \(String(format: "%.7f", time))"
    }
}

extension Array {

    func toJSON() -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .withoutEscapingSlashes)
        return String(data: jsonData, encoding: .utf8)!
    }
}
