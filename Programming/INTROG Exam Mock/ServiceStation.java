import java.util.ArrayList;

public class ServiceStation
{
    
    private ArrayList<FuelPump> pump;
    
    public ServiceStation()
    {                
        pump = new ArrayList<FuelPump>();
        
        storeFuelPump(new FuelPump(true, "idle", 106.9, 1000));
        storeFuelPump(new FuelPump(true, "idle", 106.9, 800));
        storeFuelPump(new FuelPump(true, "idle", 106.9, 700));
        storeFuelPump(new FuelPump(true, "idle", 106.9, 600));
        
        storeFuelPump(new FuelPump(false, "in use", 104.0, 950));
        storeFuelPump(new FuelPump(false, "in use", 104.0, 850));
        storeFuelPump(new FuelPump(false, "in use", 104.0, 750));
        storeFuelPump(new FuelPump(false, "in use", 104.0, 650));
    }
    
    public void storeFuelPump(FuelPump a_pump)
    {
        pump.add(a_pump);
    }
    
    public FuelPump choosePump(boolean isPetrolRequired, int requiredFuelAmount)
    {
        FuelPump retPump = null;
        for(FuelPump a_pump: pump)
        {
            if(a_pump.getStatus() == "idle")
            {
                if(a_pump.isDiesel() == isPetrolRequired)
                {
                    if(a_pump.getFuelAvailable() >= requiredFuelAmount)
                    {
                        if(retPump == null)
                        {
                            retPump = a_pump;
                        }
                        if(a_pump.getFuelAvailable() > retPump.getFuelAvailable())
                        {
                            retPump = a_pump;
                        }
                    }
                }
            }
        }
        return retPump;
    }
}
