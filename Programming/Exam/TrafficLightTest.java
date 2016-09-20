

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class TrafficLightTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class TrafficLightTest
{
    /**
     * Default constructor for test class TrafficLightTest
     */
    public TrafficLightTest()
    {
    }

    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    @Before
    public void setUp()
    {
    }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    @After
    public void tearDown()
    {
    }

    @Test
    public void isLastChangedPositive()
    {
        TrafficLight trafficL1 = new TrafficLight("red");
        assertTrue(trafficL1.getLastChanged() > 0);
    }  
    

    @Test
    public void isGetDisplayRed()
    {
        TrafficLight trafficL1 = new TrafficLight("red");
        assertEquals("red", trafficL1.getDisplay());
    }
}


