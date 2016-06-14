open domain
open syntax

pred Learn[f : Function, inputs : set Text, output : (Text -> one Text)]{
	all input : inputs |
		some eval : (Function -> Text) when Semantics[eval, input] |
			equalText[eval[f], output[input]]
}

pred LearnOne[f : Function, input : Text, output : Text]{
	some eval : (Function -> Text) | Semantics[eval, input] &&
		equalText[eval[f], output]
}
