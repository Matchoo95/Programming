

public class TrafficLight
{
    private String location;
    private String display;
    private int lastChanged;
   
    public TrafficLight(String loc) 
    {    
        display = "red";
        lastChanged = 0;
    }
    
    public TrafficLight(String loc, String col, int changed)
    {
    
    }
    
    public String getLocation()
    {
        return location;
    }
    
    public String getDisplay()
    {
        return display;
    }
    
    public int getLastChanged()
    {
        return lastChanged;
    }
    
    public void changeDisplay()
    {
        String currentDisplay = display;
        
        if(currentDisplay == "red")
        {
            display = "amber";
        }
        
        if(currentDisplay == "amber")
        {
            display = "green";
        }
        
        if(currentDisplay == "green")
        {
            display = "red";
        }
                
    }
    
    public void tick()
    {
        lastChanged++;
    }
    
    public void resetLastChanged()
    {
        lastChanged = 0;
    }
    
    public String toString()
    {
        String aString;
        
        return aString = ("Location: " + location + ", Current Display: " + display);
        
        
    }
    
    
    public void setDisplay(String newDisplay)
    {
        display = newDisplay;
    }
    
    
}
