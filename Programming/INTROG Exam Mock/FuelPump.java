import java.util.ArrayList;

/**
 * A class to represent a fuel pump
 */
public class FuelPump
{
    private boolean diesel;
    private String status;
    private double price;
    private int fuelAvailable;
    /**
     * Perform any initialization that is required
    **/
    public FuelPump(boolean diesel, String status, double price, int fuelAvailable) 
    {    
        
    }
    
    public FuelPump(boolean fuel, String idle)
    {
        diesel = fuel;
        status = idle;
        price = 105.9;
        fuelAvailable = 1000;        
    }
    
    public void setStatus(String newStatus)
    {
        status = newStatus;
    }
      

    /**
     * @return Fuel type
     */
    public boolean isDiesel()
    {
        return diesel;
    }
    /**
     * @return Status
     */
    public String getStatus()
    {
        return status;
    }
    /**
     * @return Price
     */
    public double getPrice()
    {
        return price;
    }
    /**
     * @return Available Fuel
     */
    public int getFuelAvailable()
    {
        return fuelAvailable;
    }
    
    /**
     * Change price per litre of fuel
     */
    public void changePrice(double newPrice)
    {
        price = newPrice;
    }
    
    
    /**
     * Show value of fuel per litre
     */
    public int fuelValue()
    {                
        int totalValue = 0;
        if(fuelAvailable > 0) {
            totalValue = (int)Math.round(price * fuelAvailable);
        }
        return totalValue;
    }

    /**
     * @return reduce the fuel that is available
     */
    public void dispenseFuel(int amount)
    {
        if(fuelAvailable > 0) {
            fuelAvailable -= amount;
        }
    }
    
    public String toString()
    {
        String fuelIsDiesel;
        String aString;
        if(diesel = true){
            fuelIsDiesel = "diesel";
        }else{
            fuelIsDiesel = "petrol";
        }
        
        return aString = ("Fuel: " + fuelIsDiesel + ", Status of pump: " + status + ", Available fuel:" + fuelAvailable);
        
    }
        

}
   
