open domain

//Function is something that returns a text
abstract sig Function{}

//InputFunction returns the input text
sig InputFunction extends Function{	
}

//Its output should be the input example
pred InputSemantics[f : InputFunction, input : Text, eval : (Function -> Text)]{
	equalText[input, eval[f]]
}

//ConstantFunction returns a constant text
sig ConstantFunction extends Function{
	constant : String
}

//Its output should be the text stored inside it
pred ConstantSemantics[f : ConstantFunction, input : Text, eval : (Function -> Text)]{
	eval[f].text = 0 -> f.constant
}

//SubstringFunction returns a substring of the text returned by the child function
sig SubstringFunction extends Function{
	begin: Int,
	end: Int,
	child: one Function
}

//Its output should be a substring of the child function
pred SubstringSemantics[f : SubstringFunction, input : Text, eval : (Function -> Text)]{
	f.begin >= 0
	f.end <= eval[f.child].text.lastIdx
	f.begin <= f.end
	eval[f].text = eval[f.child].text.subseq[f.begin, f.end]
}

//ConcatFunction returns the concatenation of the child functions
sig ConcatFunction extends Function{
	left : one Function,
	right: one Function
}

//Its output should be the concatenation of the left and the right side
pred ConcatSemantics[f : ConcatFunction, input : Text, eval : (Function -> Text)]{
	eval[f].text = eval[f.left].text.append[eval[f.right].text]
}


//acyclic ensures that a relation is acyclic within a set
pred acyclic[r: univ->univ, s: set univ] {
  all x: s | x !in x.^r
}

//Our function graph should be a DAG
fact FunctionIsDAG{
	acyclic[child
			+left+right
			,Function]
}


//Semantics checker
pred Semantics[eval : (Function -> Text), input: Text]{
	all f : ConstantFunction | ConstantSemantics[f, input, eval]
	all f : InputFunction | InputSemantics[f, input, eval]
	all f : SubstringFunction | SubstringSemantics[f, input, eval]
	all f : ConcatFunction | ConcatSemantics[f, input, eval]
}
