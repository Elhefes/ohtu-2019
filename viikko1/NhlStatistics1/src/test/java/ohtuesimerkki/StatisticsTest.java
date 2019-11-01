package ohtuesimerkki;

import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import org.junit.Before;
import org.junit.Test;

public class StatisticsTest {
 
    Reader readerStub = new Reader() {
 
        public List<Player> getPlayers() {
            ArrayList<Player> players = new ArrayList<>();
 
            players.add(new Player("Semenko", "EDM", 4, 12));
            players.add(new Player("Lemieux", "PIT", 45, 54));
            players.add(new Player("Kurri",   "EDM", 37, 53));
            players.add(new Player("Yzerman", "DET", 42, 56));
            players.add(new Player("Gretzky", "EDM", 35, 89));
 
            return players;
        }
    };
 
    Statistics stats;

    @Before
    public void setUp(){
        // luodaan Statistics-olio joka käyttää "stubia"
        stats = new Statistics(readerStub);
    } 
    
    @Test
    public void searchReturnsCorrectName() {
        Player player = stats.search("Semenko");
        assertEquals("Semenko", player.getName());
    }
    
    @Test
    public void searchingUnexistingReturnNull() {
        Player player = stats.search("h");
        assertNull(player);
    }
    
    @Test
    public void teamWorks() {
        List<Player> team = stats.team("EDM");
        assertEquals("Semenko", team.get(0).getName());
    }
    
    @Test
    public void topScoreWorks() {
        List<Player> top = stats.topScorers(3);
        assertEquals("Gretzky", top.get(0).getName());
    }
    

}
