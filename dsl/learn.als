open domain
open syntax

//Learn ensures that the Function maps the given inputs to the outputs
pred Learn[f : Function, inputs : set Text, output : (Text -> one Text)]{
	all input : inputs |
		some eval : (Function -> Text) when Semantics[eval, input] |
			equalText[eval[f], output[input]]
}

//LearnOne ensures that the Function maps the input to the output
pred LearnOne[f : Function, input : Text, output : Text]{
	some eval : (Function -> Text) | Semantics[eval, input] &&
		equalText[eval[f], output]
}
