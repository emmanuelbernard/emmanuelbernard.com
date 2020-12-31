///usr/bin/env jbang "$0" "$@" ; exit $?
//JAVA 15
// //DEPS <dependency1> <dependency2>

import static java.lang.System.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.FileTime;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class migrate {
    private static Pattern DATE_PATTERN = Pattern.compile("([0-9]{4})-([0-9]{2})-([0-9]{2}).*");

    public static void main(String... args) throws IOException {
        File source = new File("/Users/emmanuel/Sites/emmanuelbernard.com/blog");
        String destinationName = "/Users/emmanuel/Sites/emmanuelbernard.com/_posts";
        for (File file: new File(destinationName).listFiles())
            if (!file.isDirectory())
                file.delete();

        for (final File fileEntry : source.listFiles( (FilenameFilter) (dir, name) -> name.endsWith(".md") || name.endsWith(".erb"))) {
            out.println(fileEntry.getName());
            FileSystem fileSystem = FileSystems.getDefault();

            Path fileToRead = fileSystem.getPath(fileEntry.getAbsolutePath());
            List<String> lines = readAllLines(fileToRead, Charset.defaultCharset());
            if (!isFrontmatter(fileToRead, lines)) {
                continue;
            }
            if (!isDatePresent(fileEntry, fileToRead, lines)) {
                Matcher m = DATE_PATTERN.matcher(fileEntry.getName());
                StringBuilder date = new StringBuilder("date: ");
                if (!m.find()) {
                    // in case a file has no date
                    FileTime fileTime = Files.getLastModifiedTime(fileToRead);
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    date.append(dateFormat.format(fileTime.toMillis()));
                    lines.add(frontmatterIndex(fileToRead, lines), "draft: true");
                    err.println("Cannot extract date from file name: " + fileEntry.getName() + " | file timestamp: " + date.toString() + " |  Mark as draft");
                }
                else { 
                    date.append(m.group(1)).append("-").append(m.group(2)).append("-").append(m.group(3));
                }
                lines.add(frontmatterIndex(fileToRead, lines), date.toString());
            }
            removeLayout(fileEntry, fileToRead, lines);
            
            //Files.copy(
            //    fileToRead,
            //    fileSystem.getPath(destinationName, fileEntry.getName()),
            //    StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.COPY_ATTRIBUTES);
            
            // convert erb files into html ones
            File destination = new File(fileSystem.getPath(destinationName, fileEntry.getName()).toString().replace(".html.erb", ".html"));
            PrintWriter fw = new PrintWriter(destination);
            for (String line : lines) {
                fw.println(line);
            }
            fw.close();
            destination.setLastModified(fileToRead.toFile().lastModified());

        }
    }

    private static boolean isDatePresent(final File fileEntry, Path fileToRead, List<String> lines) {
        boolean isDatePresent = false;
        for (int i = 1 ; i < frontmatterIndex(fileToRead, lines) ; i++) {
            if (lines.get(i).startsWith("date")) {
                err.println("date already present in frontmatter for " + fileEntry.getName());
                isDatePresent = true;
            }
        }
        return isDatePresent;
    }

    private static void removeLayout(final File fileEntry, Path fileToRead, List<String> lines) {
        int layoutIndex = -1;
        for (int i = 1 ; i < frontmatterIndex(fileToRead, lines) ; i++) {
            if (lines.get(i).startsWith("layout")) {
                layoutIndex = i;
                break;
            }
        }
        if (layoutIndex != -1) {
            lines.remove(layoutIndex);

        }
    }

    private static int frontmatterIndex(Path fileToRead, List<String> lines) {
        for (int i = 1 ; i < 30 ; i++) {
            if ("---".equals(lines.get(i))) return i;
        }
        return 0;
    }
    private static boolean isFrontmatter(Path fileToRead, List<String> lines) {
        if (!"---".equals(lines.get(0))) {
            err.println("Unable to recognize frontmatter for (first line) " + fileToRead.toString());
            return false;
        }
        if ( 0 == frontmatterIndex(fileToRead, lines)) {
            err.println("Unable to recognize frontmatter for (last line) " + fileToRead.toString());
            return false;
        }
        return true;
    }

    public static List<String> readAllLines(Path path, Charset cs) throws IOException {
        try (BufferedReader reader = Files.newBufferedReader(path, cs)) {
            List<String> result = new ArrayList<>();
            for (;;) {
                String line = reader.readLine();
                if (line == null)
                    break;
                result.add(line);
            }
            return result;
        }
    }
}
