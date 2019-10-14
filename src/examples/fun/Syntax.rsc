@license{
Copyright (c) 2017, Paul Klint
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
}
module examples::fun::Syntax

extend examples::CommonLex;
 
// Functional language with declared types

start syntax Fun
    = Expression
    ;

syntax Type 
   = "bool"
   | "int"
   | "str"
   | left Type from "-\>" Type to
   ; 
      
syntax Expression 
   = Id name
   | Integer intcon 
   | Boolean boolcon
   | String strcon
   | bracket "(" Expression e ")"                   
    > left Expression lhs "+" Expression rhs                                          
    > left Expression lhs "&&" Expression rhs  
   | "fun" Id name ":" Type tp "{" Expression exp "}"
   >  left Expression exp1 "(" Expression exp2  ")"
   | "let" Id name ":" Type tp "=" Expression exp1 "in" Expression exp2 "end"
   | "if" Expression cond "then" Expression thenPart "else" Expression elsePart "fi" 
   ;
   
keyword Reserved 
    = "if" | "then" | "else" | "fi" | 
      "let" | "in" | "fun" | "end" |
      "int" | "bool"
    ;
   