sig Text{
	text : seq String
}

pred equalText[s, s' : Text]{
	s.text = s'.text
}
