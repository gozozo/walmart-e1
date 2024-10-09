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

    /// Generates an array of integers.
    /// 
    /// - Returns: An array of integers.
    private func generateArray() -> [Int] {
        return (1...10000).map { _ in Int.random(in: 0...100) }
    }

    /// Builds a descriptive text for a given method result and execution time.
    ///
    /// - Parameters:
    ///   - forMethod: The name of the method for which the text is being built.
    ///   - result: The result of the method execution.
    ///   - time: The time taken for the method execution in seconds.
    /// - Returns: A formatted string describing the method, its result, and the execution time.
    private func buildText(forMethod: String, result: Int, time: Double) -> String {
        return "\(forMethod) Result: \(result) Time: \(String(format: "%.7f", time))"
    }
}

extension Array {

    /// Converts the current object to a JSON string representation.
    /// 
    /// - Returns: A `String` containing the JSON representation of the object.
    func toJSON() -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .withoutEscapingSlashes)
        return String(data: jsonData, encoding: .utf8)!
    }
}
