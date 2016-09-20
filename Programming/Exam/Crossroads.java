import java.util.ArrayList;

public class Crossroads
{
  
    private ArrayList<TrafficLight> light;
   
    public Crossroads()
    {
        light = new ArrayList<TrafficLight>();
        
        storeTrafficLight(new TrafficLight("London Rd North"));
        storeTrafficLight(new TrafficLight("London Rd South"));
        storeTrafficLight(new TrafficLight("London Rd East"));
        storeTrafficLight(new TrafficLight("London Rd West"));
        
        
    
    }

    public void storeTrafficLight(TrafficLight a_light)
    {
        light.add(a_light);
    }
    
    public void operateLight(String location)
    {        
        int counter = 0; 
        for(TrafficLight a_light: light)      
            while(counter != 3)
            {                               
            
                if(a_light.getDisplay() == "red")
                {
                    a_light.setDisplay("amber");
                    System.out.println("Colour: " + a_light.getDisplay());
                    
                }
                else if(a_light.getDisplay() == "amber")
                {
                    a_light.setDisplay("green");
                    System.out.println("Colour: " + a_light.getDisplay());
                               
                }else if(a_light.getDisplay() == "green")
                {
                    a_light.setDisplay("red");;
                    System.out.println("Colour: " + a_light.getDisplay());
                    
                } 
                
                if(counter > 3)
                {
                    counter = 0;
                }
                counter++; 
            }
    }
    
}

    
