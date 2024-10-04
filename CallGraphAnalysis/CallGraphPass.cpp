#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <set>  // Include the set header for storing edges

using namespace llvm;

namespace {
    struct CallGraphPass : public ModulePass {
        static char ID;
        CallGraphPass() : ModulePass(ID) {}

        // The main function to run the pass on a module
        bool runOnModule(Module &M) override {
            // Create a file to store the call graph in DOT format
            std::ofstream dotFile("callgraph.dot");
            dotFile << "digraph CallGraph {\n";

            // Build the call graph for the module
            CallGraph CG(M);
            std::set<std::pair<std::string, std::string>> edges; // Set to track unique edges

            // Iterate over all the functions in the call graph
            for (auto &Node : CG) {
                if (Function *F = Node.second->getFunction()) {
                    if (F->isDeclaration()) {
                        continue;  // Skip external/declaration-only functions
                    }
                    std::string CallerName = F->getName().str();

                    // Iterate over all the called functions from this function
                    for (auto &CallRecord : *Node.second) {
                        if (CallGraphNode *CalleeNode = CallRecord.second) {
                            if (Function *Callee = CalleeNode->getFunction()) {
                                if (!Callee->isDeclaration()) {
                                    std::string CalleeName = Callee->getName().str();
                                    
                                    // Create a pair to represent the edge
                                    auto edge = std::make_pair(CallerName, CalleeName);
                                    
                                    // Check if the edge already exists
                                    if (edges.insert(edge).second) {
                                        // Write the caller-callee relationship to the DOT file if it's a new edge
                                        dotFile << "\"" << CallerName << "\" -> \"" << CalleeName << "\";\n";
                                    }
                                }
                            }
                        }
                    }
                }
            }

            dotFile << "}\n";
            dotFile.close();

            errs() << "Call graph has been generated as callgraph.dot\n";
            return false;
        }
    };
}

char CallGraphPass::ID = 0;
static RegisterPass<CallGraphPass> X("callgraphpass", "Call Graph Pass", false, false);
