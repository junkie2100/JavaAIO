import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
/**
 *
 * @author Thomas Otero H3R3T1C
 */
public class Updater {
    public final static String versionURL = "http://unleashedprepaids.com/upload/devs/junkie2100/javatool/version.txt"; 
    public final static String historyURL = "http://unleashedprepaids.com/upload/devs/junkie2100/javatool/history.txt";
    public static String getLatestVersion() throws Exception
    {
        String data = getData(versionURL);
        return data.substring(data.indexOf("[version]")+9,data.indexOf("[/version]"));
    }
   
    public static String getWhatsNew() throws Exception
    {
        String data = getData(historyURL);
        return data.substring(data.indexOf("[history]")+9,data.indexOf("[/history]"));
    }
 
        public static String getData(String address)throws Exception
    {
        URL url = new URL(address);
        
        InputStream html = null;

        html = url.openStream();
        
        int c = 0;
        StringBuffer buffer = new StringBuffer("");

        while(c != -1) {
            c = html.read();
            
        buffer.append((char)c);
        }
        return buffer.toString();
    }

    public Updater() {

    }
}


