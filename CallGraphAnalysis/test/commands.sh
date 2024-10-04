# A simple test to show how to use the call graph analysis LLVM OPT pass on an input c file

rm *.dot *.ll
clang-10 -S -emit-llvm stack.c -lpthread -I ./ -o stack.ll
opt -load ../libCallGraphPass.so -callgraphpass stack.ll 
mv callgraph.dot stack.dot
dot -Tpng stack.dot -o stack.png
