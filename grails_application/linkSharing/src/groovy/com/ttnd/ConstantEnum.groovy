package com.ttnd

public class ConstantEnum {
public enum Visibility {
     PUBLIC('Public'),
    PRIVATE('Private')

       String name

    Visibility(String name) {
         this.name = name
       }

    }



public enum Seriousness {
    SERIOUS('Serious'),
    VERY_SERIOUS('Very Serious'),
    CASUAL ('Causal')

    String name

    Seriousness(String name) {
        this.name = name
    }

}}