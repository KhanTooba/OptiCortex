#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include <string>

using namespace llvm;

namespace {
struct PrintLLVMInstructions : public FunctionPass {
  static char ID;
  PrintLLVMInstructions() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) override {
    errs() << "Function: " << F.getName() << "\n";
    int instructionCount = 0;
    
    for (auto &BB : F) {
      for (auto &I : BB) {
        errs() << "LLVM IR Instruction [" << instructionCount << "]: ";
        I.print(errs());
        errs() << "\n";
        instructionCount++;
      }
    }
    return false; // Does not modify the function
  }
};
} // namespace

char PrintLLVMInstructions::ID = 0;
static RegisterPass<PrintLLVMInstructions> X("print-llvm-instr", "Print LLVM Instructions with IDs", false, false);
