package com.test;



	import static org.junit.Assert.*;  
	  
	import org.junit.Before;  
	import org.junit.Test;  
	  
	public class CalculateTest {  
	  
    Calculate data=new Calculate();  
	    @Before  
	    public void setUp() throws Exception {  
	    }  
  
	    @Test  
	    public void testAdd() {  
        data.add(1, 1);  
       assertEquals(2, data.add(1, 1));  
    }  
 
	    @Test  
    public void testReduce() {  
        data.reduce(2, 1);  
        assertEquals(4, data.add(3, 1));  
    }  
  
    @Test  
    public void testMultiply() {  
        data.multiply(3, 4);  
	    }  
 
    @Test  
	    public void testDivide() {  
	        data.divide(6, 3);  
    }  
}
