String enumValuetoString(Object o){return o.toString().split('.').last.toLowerCase();}

enumValuefromString<T>(String key, Iterable<T> values) {

return values.firstWhere((v) => v!=null&&key==enumValuetoString(v),
orElse: ()=>null);}