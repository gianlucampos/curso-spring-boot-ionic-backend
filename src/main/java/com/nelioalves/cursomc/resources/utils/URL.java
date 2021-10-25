package com.nelioalves.cursomc.resources.utils;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class URL {

    public static String decodeParam(String s) {
        return URLDecoder.decode(s, StandardCharsets.UTF_8);
    }

    public static List<Long> decodeIntList(String s) {
        return Arrays.stream(s.split(",")).map(Long::parseLong).collect(Collectors.toList());
    }
}
