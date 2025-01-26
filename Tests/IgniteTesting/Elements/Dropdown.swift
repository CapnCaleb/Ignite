//
//  Dropdown.swift
//  Ignite
//  https://www.github.com/twostraws/Ignite
//  See LICENSE for license information.
//

import Foundation
import Testing

@testable import Ignite

/// Tests for the `Dropdown` element.
@Suite("Dropdown Tests")
@MainActor
struct DropdownTests {
    @Test("basic Dropdown Text Test")
    func basicDropdownText() async throws {
        let element = Dropdown("Click Me") {
            Text("Content1")
            Text("Content2")
            Text("Or you can just…")
        }.role(.primary)
        let output = element.render()
        
        let expectedOutput = """
                <div class="dropdown"><button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Click Me</button><ul class="dropdown-menu"><li><p class="dropdown-header">Content1</p></li><li><p class="dropdown-header">Content2</p></li><li><p class="dropdown-header">Or you can just…</p></li></ul></div>
                """
        
        #expect(output == expectedOutput)
    }
    
    @Test("Dropdown Role Test")
    func dropdownRole() async throws {
        let element = Dropdown("Click Me") {
            Text("Content1")
        }.role(.secondary)
        
        let output = element.render()
        
        let expectedOutput = """
        <div class="dropdown"><button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Click Me</button><ul class="dropdown-menu"><li><p class="dropdown-header">Content1</p></li></ul></div>
        """
        
        #expect(output == expectedOutput)
    }
    
    @Test("Empty Dropdown Test")
    func emptyDropdown() async throws {
        let element = Dropdown("Click Me") {}.role(.primary)
        
        let output = element.render()
        
        let expectedOutput = """
        <div class="dropdown"><button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Click Me</button><ul class="dropdown-menu"></ul></div>
        """
        
        #expect(output == expectedOutput)
    }
    
    @Test("Dropdown Large Content Test")
    func dropdownLargeContent() async throws {
        let element = Dropdown("Click Me") {
            for i in 1...50 {
                Text("Item \(i)")
            }
        }.role(.primary)
        
        let output = element.render()
        
        var expectedOutput = """
        <div class="dropdown"><button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Click Me</button><ul class="dropdown-menu">
        """
        for i in 1...50 {
            expectedOutput += "<li><p class=\"dropdown-header\">Item \(i)</p></li>"
        }
        expectedOutput += "</ul></div>"
        
        #expect(output == expectedOutput)
    }
    
}
