//Text is a sequence of Characters
sig Text{
	text : seq String //String in alloy represents a constant string, so we are using it as a character
}

//Compare two texts
pred equalText[s, s' : Text]{
	s.text = s'.text
}
