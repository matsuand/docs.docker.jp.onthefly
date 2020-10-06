%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
published: false
title: "Docker Distribution JSON Canonicalization"
description: "Explains registry JSON objects"
keywords: ["registry, service, images, repository,  json"]
---
@y
---
published: false
title: "Docker Distribution JSON Canonicalization"
description: "Explains registry JSON objects"
keywords: ["registry, service, images, repository,  json"]
---
@z

@x
# Docker Distribution JSON Canonicalization
@y
# Docker Distribution JSON Canonicalization
@z

@x
To provide consistent content hashing of JSON objects throughout Docker
Distribution APIs, the specification defines a canonical JSON format. Adopting
such a canonicalization also aids in caching JSON responses.
@y
To provide consistent content hashing of JSON objects throughout Docker
Distribution APIs, the specification defines a canonical JSON format. Adopting
such a canonicalization also aids in caching JSON responses.
@z

@x
Note that protocols should not be designed to depend on identical JSON being
generated across different versions or clients. The canonicalization rules are
merely useful for caching and consistency.
@y
Note that protocols should not be designed to depend on identical JSON being
generated across different versions or clients. The canonicalization rules are
merely useful for caching and consistency.
@z

@x
## Rules
@y
## Rules
@z

@x
Compliant JSON should conform to the following rules:
@y
Compliant JSON should conform to the following rules:
@z

@x
1. All generated JSON should comply with [RFC
   7159](http://www.ietf.org/rfc/rfc7159.txt).
2. Resulting "JSON text" shall always be encoded in UTF-8.
3. Unless a canonical key order is defined for a particular schema, object
   keys shall always appear in lexically sorted order.
4. All whitespace between tokens should be removed.
5. No "trailing commas" are allowed in object or array definitions.
6. The angle brackets "<" and ">" are escaped to "\u003c" and "\u003e".
   Ampersand "&" is escaped to "\u0026".
@y
1. All generated JSON should comply with [RFC
   7159](http://www.ietf.org/rfc/rfc7159.txt).
2. Resulting "JSON text" shall always be encoded in UTF-8.
3. Unless a canonical key order is defined for a particular schema, object
   keys shall always appear in lexically sorted order.
4. All whitespace between tokens should be removed.
5. No "trailing commas" are allowed in object or array definitions.
6. The angle brackets "<" and ">" are escaped to "\u003c" and "\u003e".
   Ampersand "&" is escaped to "\u0026".
@z

@x
## Examples
@y
## Examples
@z

@x
The following is a simple example of a canonicalized JSON string:
@y
The following is a simple example of a canonicalized JSON string:
@z

@x
```json
{"asdf":1,"qwer":[],"zxcv":[{},true,1000000000,"tyui"]}
```
@y
```json
{"asdf":1,"qwer":[],"zxcv":[{},true,1000000000,"tyui"]}
```
@z

@x
## Reference
@y
## Reference
@z

@x
### Other Canonicalizations
@y
### Other Canonicalizations
@z

@x
The OLPC project specifies [Canonical
JSON](http://wiki.laptop.org/go/Canonical_JSON). While this is used in
[TUF](http://theupdateframework.com/), which may be used with other
distribution-related protocols, this alternative format has been proposed in
case the original source changes. Specifications complying with either this
specification or an alternative should explicitly call out the
canonicalization format. Except for key ordering, this specification is mostly
compatible.
@y
The OLPC project specifies [Canonical
JSON](http://wiki.laptop.org/go/Canonical_JSON). While this is used in
[TUF](http://theupdateframework.com/), which may be used with other
distribution-related protocols, this alternative format has been proposed in
case the original source changes. Specifications complying with either this
specification or an alternative should explicitly call out the
canonicalization format. Except for key ordering, this specification is mostly
compatible.
@z

@x
### Go
@y
### Go
@z

@x
In Go, the [`encoding/json`](http://golang.org/pkg/encoding/json/) library
will emit canonical JSON by default. Simply using `json.Marshal` will suffice
in most cases:
@y
In Go, the [`encoding/json`](http://golang.org/pkg/encoding/json/) library
will emit canonical JSON by default. Simply using `json.Marshal` will suffice
in most cases:
@z

@x
```go
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}
@y
```go
incoming := map[string]interface{}{
    "asdf": 1,
    "qwer": []interface{}{},
    "zxcv": []interface{}{
        map[string]interface{}{},
        true,
        int(1e9),
        "tyui",
    },
}
@z

@x
canonical, err := json.Marshal(incoming)
if err != nil {
  // ... handle error
}
```
@y
canonical, err := json.Marshal(incoming)
if err != nil {
  // ... handle error
}
```
@z

@x
To apply canonical JSON format spacing to an existing serialized JSON buffer, one
can use
[`json.Indent`](http://golang.org/src/encoding/json/indent.go?s=1918:1989#L65)
with the following arguments:
@y
To apply canonical JSON format spacing to an existing serialized JSON buffer, one
can use
[`json.Indent`](http://golang.org/src/encoding/json/indent.go?s=1918:1989#L65)
with the following arguments:
@z

@x
```go
incoming := getBytes()
var canonical bytes.Buffer
if err := json.Indent(&canonical, incoming, "", ""); err != nil {
	// ... handle error
}
```
@y
```go
incoming := getBytes()
var canonical bytes.Buffer
if err := json.Indent(&canonical, incoming, "", ""); err != nil {
	// ... handle error
}
```
@z
