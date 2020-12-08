//
//  Day08.swift
//  Advent2020
//
//  Created by Michael Malinak on 12/8/20.
//

import Foundation

struct Day08: Day {

   enum Operation: String {
      case nop
      case acc
      case jmp
   }

   enum ReturnCode {
      case InfLoop
      case Success
   }

   struct Instruction {
      var op: Operation
      var arg: Int
   }

   func parseInstructions(_ data: String) -> [Instruction] {
      return data.components(separatedBy: "\n").map{ $0.components(separatedBy: " ") }.compactMap {
         Instruction(op: Operation(rawValue:$0[0])!, arg: Int($0[1])!)
      }
   }

   typealias ProgramResult = (code: ReturnCode, result:Int)
   func executeProgram(_ program:[Instruction]) -> ProgramResult {
      var instructionsSeen = Set<Int>()
      var acc = 0
      var instrIdx = 0
      var returnCode = ReturnCode.Success

      repeat {
         if( instructionsSeen.contains(instrIdx) ) {
            print("Loop Detected")
            returnCode = .InfLoop
            break
         } else if (instrIdx == program.count) {
            print("Finished Program")
            break
         } else {
            instructionsSeen.insert(instrIdx)
         }

         let inst = program[instrIdx]

         switch inst.op {
         case .acc:
            acc += inst.arg
            instrIdx += 1
         case .jmp:
            instrIdx += inst.arg
         case .nop:
            instrIdx += 1
         }
      } while (true)

      return (returnCode, acc)
   }

   func partA(_ data: String) -> Int {
      let program = parseInstructions( data )
      return executeProgram( program).result
   }

   func partB(_ data: String) -> Int {
      let program = parseInstructions( data )

      for (i,x) in program.enumerated() {
         guard ( x.op != .acc ) else {
            continue
         }
         var programCopy = program

         switch x.op {
         case .jmp:
            programCopy[i].op = .nop
         case .nop:
            programCopy[i].op = .jmp
         case .acc:
            return 0
         }

         let result = executeProgram(programCopy)
         if (result.code == .Success) {
            return result.result
         }
      }
      return 0
   }




}
