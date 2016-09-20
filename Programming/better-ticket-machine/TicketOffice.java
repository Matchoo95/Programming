import java.util.*;
/**
 * class TicketOffice represents a ticket office that sells 
 * railway tickets to two different destinations.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class TicketOffice
{
    // instance variables - replace the example below with your own
    private TicketMachine london;
    private TicketMachine exeter;

    /**
     * Constructor for objects of class TicketOffice
     */
    public TicketOffice()
    {
        // initialise instance variables
        london = new TicketMachine(30);
        exeter = new TicketMachine(50);
    }

    /**
     * An example of a method - replace this comment with your own
     * 
     * @param  y   a sample parameter for a method
     * @return     the sum of x and y 
     */
    public void buyTickets()
    {     
        String reply;
        Scanner scanner = new Scanner(System.in);
        System.out.println( "Welcome to Portsmouth Railway Station");
        System.out.println( " You may buy train tickets to London or Exeter");
        System.out.println( " Do you want to buy a ticket (Y or N)? ");
        reply = scanner.nextLine();
        while(reply.charAt(0) == 'Y' || reply.charAt(0) == 'y')
        {
            System.out.println("Enter L for London or E for Exeter");
            reply = scanner.nextLine();
            if(reply.charAt(0) == 'L') {
                london.insertMoney(30);
                london.printTicket();
            } else if (reply.charAt(0) == 'E') {
                exeter.insertMoney(50);
                exeter.printTicket();
            } else {
                System.out.println(" Sorry I don't recognise your destination");
            }
            System.out.println( " Do you want to buy another ticket (Y or N)? ");
            reply = scanner.nextLine();
        }
        System.out.println( "Summary of Today's Ticket Sales");
        System.out.println( "Ticket sales to London totalled " + london.getTotal()
                                + "pounds");
        int nTickets = london.getTotal()/30;
        System.out.println( " Total number of tickets to London sold was " + nTickets);
        System.out.println( "Ticket sales to Exeter totalled " + exeter.getTotal()
                                + "pounds");
        nTickets = exeter.getTotal()/30;
        System.out.println( " Total number of tickets to Exeter sold was " + nTickets);
        
    }
}
