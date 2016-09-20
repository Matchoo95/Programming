public class Heater
{
    private int temperature;
    private int min;
    private int max;
    private int increment;
    
    
    public Heater(int minimum, int maximum)
    {
        min = minimum;
        max = maximum;
        temperature = 15;
        increment = 5;
    }
    
    public int getTemperature()
    {
        return temperature;
    }
    
    public void warmer()
    {
        if(temperature >= max) {
            temperature = max - 1;
        }
        else {
            temperature = temperature + increment;
        }
    }
    
    public void cooler()
    {
        if(temperature <= min) {
            temperature = min + 1;
        }
        else {
            temperature = temperature + increment;
        }
    }
    
    public int setIncrement(int setInc)
    {
        increment = setInc;
        if(increment < 0) {
            increment = increment + 1;
        }
        return increment;
    }
}
