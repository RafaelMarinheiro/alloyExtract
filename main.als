open dsl/domain
open dsl/syntax
open dsl/learn

one sig Input0 extends Text{}
one sig Output0 extends Text{}

fact{
	Text.text.elems in {"0" + "1" + "2" + "3" + "4" +  "5" +  "6" + "7" + "8" + "9" + "-" + "(" + ")"}
}

pred synth[f : one Function]{
	Input0.text = 	  {0 -> "1"}
				+{1 -> "2"}
				+{2 -> "3"}

	
	Output0.text =   {0 -> "("}
				+{1 -> "2"}
				+{2 -> ")"}

	Learn[f, Input0, 
			{
				(Input0 -> Output0)
			 }]
}

run synth for 10 seq,
		exactly 13 String,
		10 Text,
		7 int,
		exactly 6 Function,
		exactly 1 InputFunction,
		exactly 1 SubstringFunction,
		exactly 2 ConcatFunction,
		exactly 2 ConstantFunction
