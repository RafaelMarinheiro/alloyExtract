open dsl/learn

one sig Input0 extends Text{}
one sig Output0 extends Text{}

one sig Input1 extends Text{}
one sig Output1 extends Text{}


fact{
	Text.text.elems in {"0" + "1" + "2" + "3" + "4" +  "5" +  "6" + "7" + "8" + "9" + "-" + "(" + ")"}

	all t : Text | some t.text
}

pred synth[f : one Function]{
	Input0.text = 	  {0 -> "1"}
				+{1 -> "2"}
				+{2 -> "3"}

	
	Output0.text =   {0 -> "("}
				+{1 -> "1"}
				+{2 -> "3"}
				+{3 -> ")"}

	Input1.text = 	  {0 -> "4"}
				+{1 -> "5"}
				+{2 -> "6"}

	
	Output1.text =   {0 -> "("}
				+{1 -> "4"}
				+{2 -> "6"}
				+{3 -> ")"}

	ConstantFunction.constant in {"-" + "(" + ")"}
	Learn[f, Input0 + Input1, 
			{
				(Input0 -> Output0)
			     +(Input1 -> Output1)
			 }]
}

run synth for 5 seq,
		exactly 13 String,
		16 Text,
		4 int,
		8 Function,
		exactly 1 InputFunction,
		exactly 2 ConstantFunction
