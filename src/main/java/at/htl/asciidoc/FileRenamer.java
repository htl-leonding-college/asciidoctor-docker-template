package at.htl.asciidoc;

import org.w3c.dom.ls.LSOutput;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * https://asciidoctor.org/docs/user-manual/#highlight-js
 */
public class FileRenamer {

    static final String DIRECTORY = "docs" + File.separator + "highlight";

    public static void main(String[] args) {
        System.out.println(DIRECTORY);
        printFiles();
        System.out.println("=============================================");
        renameFiles();
        System.out.println("=============================================");
        printFiles();
        System.out.println("=============================================");
        renameHighlightPackJs();
    }

    private static void printFiles() {
        try (Stream<Path> walk = Files.walk(Paths.get(DIRECTORY + File.separator + "styles"))) {

            List<String> result = walk
                    .filter(Files::isRegularFile)
                    .map(x -> x.toString())
                    .collect(Collectors.toList());

            result.forEach(System.out::println);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * File-Renamer for Asciidoc-reveal-docker --> highlight.js
     */
    private static void renameFiles() {
        try (Stream<Path> walk = Files.walk(Paths.get(DIRECTORY + File.separator + "styles"))) {

            walk
                    .filter(Files::isRegularFile)
                    .forEach(file -> {
                        String fileName = file.getFileName().toString();
                        String newFileName =
                                fileName.substring(0, fileName.length() - 4)
                                        + ".min"
                                        + fileName.substring(fileName.length() - 4);

                        // tag::rename-file[]
                        try {
                            Files.move(file, // <1>
                                    file.getParent().resolve(newFileName)); // <2>
                        } catch (IOException e) {
                            System.err.println(e.getMessage());
                        }
                        // end::rename-file[]
                    });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void renameHighlightPackJs() {
        Path highlightPackJsPath = Paths.get(DIRECTORY + File.separator + "highlight.pack.js");
        System.out.println(highlightPackJsPath.toString());

        try {
            Files.move(highlightPackJsPath, highlightPackJsPath.getParent().resolve("highlight.min.js"));
        } catch (IOException e) {
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

    }

}
