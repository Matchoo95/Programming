

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * テストクラス FuelPumpTest.
 *
 * @author (あなたの名前)
 * @version (バージョン番号もしくは日付)
 */
public class FuelPumpTest
{
    /**
     * テストクラス FuelPumpTest のためのデフォルトのコンストラクタ
     */
    public FuelPumpTest()
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
    public void dispenseFuel_is_positive_integer()
    {
        FuelPump fuelPump1 = new FuelPump(true, "idle");
        assertTrue(fuelPump1.getFuelAvailable() > 0);
    }
}


