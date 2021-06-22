package com.test.nonspring02;

public class Main {

	public static void main(String[] args) {

		MyCalculator calculator;
		
		// CalSum calSum = new CalSum();
		calculator = new MyCalculator(10, 5, new CalMul());
		calculator.result();
	}

}
