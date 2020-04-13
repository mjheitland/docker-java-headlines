import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.io.IOException;

public class printheadlines {
  private static String url = "https://heise.de/newsticker/";

  public static void main(String[] args) throws IOException {
    Document doc = Jsoup.connect(url).get();
    Elements news = doc.select(".a-article-teaser__title-text");
    for (Element item : news) {
      System.out.println("*** " + item.text());
    }
  }
}