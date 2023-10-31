package com.mycompany.app;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * Unit test for Calculator App
 */
public class CalculatorTest {

	private Calculator calculator;

	public CalculatorTest() {
		//System.out.println("CalculatorTest...");
	}

	@BeforeClass
	public static void setUpClass() {
		System.out.println("@BeforeClass->setUpClass...");
	}

	@AfterClass
	public static void tearDownClass() {
		System.out.println("@AfterClass->tearDownClass...");
	}

	@Before
	public void setUp() {
		System.out.println("@Before->setUp...");
		// A new calculator is always created before each test to guarantee their
		// independence
		calculator = new Calculator();
	}

	@Test
	public void add() {
		assertEquals(2, calculator.add(1, 1), 0);
		assertEquals(1.42, calculator.add(3.14, -1.72), 0.001);
		assertEquals(2.0 / 3, calculator.add(1.0 / 3, 1.0 / 3), 0.001);
		System.out.println("\tCalculatorTest->add executed");
	}

	@Test
	public void subtract() {
		assertEquals(0, calculator.subtract(1, 1), 0);
		assertEquals(4.86, calculator.subtract(3.14, -1.72), 0.001);
		assertEquals(2.0 / 3, calculator.subtract(1.0 / 3, -1.0 / 3), 0.001);
		System.out.println("\tCalculatorTest->subtract executed");
	}

	@Test
	public void multiply() {
		assertEquals(2, calculator.multiply(1, 2), 0);
		assertEquals(-5.4008, calculator.multiply(3.14, -1.72), 0.001);
		assertEquals(0.111, calculator.multiply(1.0 / 3, 1.0 / 3), 0.001);
		System.out.println("\tCalculatorTest->multiply executed");
	}

	@Test
	public void divide() {
		assertEquals(2, calculator.divide(4, 2), 0);
		assertEquals(-1.826, calculator.divide(3.14, -1.72), 0.001);
		assertEquals(1, calculator.divide(1.0 / 3, 1.0 / 3), 0);
		System.out.println("\tCalculatorTest->divide executed");
	}

	@Test(expected = IllegalArgumentException.class)
	public void divideException() {
		calculator.divide(2, 0);
		System.out.println("\tCalculatorTest->divideException executed");
	}
}
